#!/bin/bash

set -euo pipefail

contents=$(< "${FILE_PATH}" jq '.' -MRs)

if [ -n "${CC_ACCOUNT_ID}" ]; then
    payload="{\"data\":{\"attributes\":{\"type\":\"cloudformation-template\",\"accountId\":\"${CC_ACCOUNT_ID}\",\"contents\":${contents}}}}"
else
    payload="{\"data\":{\"attributes\":{\"type\":\"cloudformation-template\",\"contents\":${contents}}}}"
fi

echo ""
echo "INFO: Beginning security scan of template"

echo Request:
echo "${payload}" | jq '.' -MR  # Without -R flag is throwing errors (control characters need to be escaped)

response=$(set +e ; curl -L --fail --show-error --silent -X POST \
    -H "Authorization: ApiKey ${CC_API_KEY}" \
    -H "Content-Type: application/vnd.api+json" \
    https://${AWS_REGION}-api.cloudconformity.com/v1/iac-scanning/scan \
    --data-binary "${payload}" | jq '.' -M | jq '.data[] | select(.attributes.status == "FAILURE")' ; set -e)

if [ -n "$response" ]; then
    highrisk=$(echo "$response" | jq 'select(.attributes | ."risk-level | contains("HIGH") or contains("EXTREME"))')
    if [ -n "$highrisk" ]; then
        echo "ERROR: HIGH Risk (or above) Violation Found via CloudConformity. You MUST fix them before deployment. Details are shown as below:"
        echo "$highrisk"
        exit 31
    fi
    echo "WARNING: LOW or MEDIUM Risk Violation Found via CloudConformity. Details are shown as below:"
    echo "$response"
else
    echo "INFO: No security risks reported by CloudConformity"
fi
