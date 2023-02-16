## CloudConformity Scan Action 🔎☁️

Scan CloudFormation templates using CloudConformity.

## Usage
```
- id: checkout
  name: Checkout code 🛒
  uses: actions/checkout@v2

- id: cfn-scan
  name: "Run cfn-scan 🔎"
  uses: reecetech/cfn-scan-action@v0
  with:
    cloudconformity-api-key: ###
    aws-region: ap-northeast-1
    cloudconformity-account-id: ###
    file-path: templates/template.yml
```
CloudConformity account ID is optional (if rules have been configured on account).

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
