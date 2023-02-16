## cfn-scan-action

Scan CloudFormation templates using CloudConformity.

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->

|           INPUT            |  TYPE  | REQUIRED | DEFAULT |                   DESCRIPTION                   |
|----------------------------|--------|----------|---------|-------------------------------------------------|
|         aws-region         | string |   true   |         |   AWS region for the Cloudformation<br>stack    |
| cloudconformity-account-id | string |  false   |         | Cloud Conformity account ID for<br>data payload |
|  cloudconformity-api-key   | string |   true   |         |            Cloud Conformity API key             |
|         file-path          | string |   true   |         |         Path to CloudFormation template         |
|         temp-input         | string |  false   |         |             Trigger update-doc step             |

<!-- AUTO-DOC-INPUT:END -->
