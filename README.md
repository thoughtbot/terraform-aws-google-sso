# Terraform Module for AWS/Google SSO Sync

This module deploys the [AWS/Google SSOSync Lambda]. You must follow the
instructions in the SSOSync project to prepare your Google directory, create
your Google credentials and prepare your SCIM endpoint. Before using this
module, Google must already be configured as the SAML provider for IAM Identity
Center.

It is recommended that you deploy this module in the [delegated administrator]
account for IAM Identity Center.

Usage:

```
module "sso_sync" {
  source = "github.com/thoughtbot/terraform-aws-google-sso?ref=VERSION"

  google_admin_email         = "google-admin@example.com"
  google_credentials         = local.secrets.GoogleCredentials
  google_group_match         = "email:aws-*"
  name                       = "aws-google-sso-sync"
  scim_endpoint_access_token = local.secrets.SCIMEndpointAccessToken
  scim_endpoint_url          = local.secrets.SCIMEndpointUrl
  semantic_version           = "2.0.2"
}


locals {
  secrets = jsondecode(
    data.aws_secretsmanager_secret_version.sso_sync.secret_string
  )
}

data "aws_secretsmanager_secret_version" "sso_sync" {
  secret_id = "aws-google-sso-sync"
}
```

[AWS/Google SSOSync Lambda]: https://github.com/awslabs/ssosync
[delegated administrator]: https://docs.aws.amazon.com/singlesignon/latest/userguide/delegated-admin.html

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_serverlessapplicationrepository_cloudformation_stack.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/serverlessapplicationrepository_cloudformation_stack) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_ssoadmin_instances.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | ID of the serverless application to deploy; defaults to official SSOSync | `string` | `null` | no |
| <a name="input_google_admin_email"></a> [google\_admin\_email](#input\_google\_admin\_email) | Email address of the Google admin who created the service account | `string` | n/a | yes |
| <a name="input_google_credentials"></a> [google\_credentials](#input\_google\_credentials) | Service account credentials for syncing users and groups | `string` | n/a | yes |
| <a name="input_google_group_match"></a> [google\_group\_match](#input\_google\_group\_match) | Pattern for finding which groups to sync (default all) | `string` | `""` | no |
| <a name="input_google_ignore_groups"></a> [google\_ignore\_groups](#input\_google\_ignore\_groups) | Google groups to ignore (default none) | `string` | `""` | no |
| <a name="input_google_ignore_users"></a> [google\_ignore\_users](#input\_google\_ignore\_users) | Google users to ignore (default none) | `string` | `""` | no |
| <a name="input_google_user_match"></a> [google\_user\_match](#input\_google\_user\_match) | Pattern for finding which users to sync (defaults to all in matched groups) | `string` | `""` | no |
| <a name="input_identity_store_id"></a> [identity\_store\_id](#input\_identity\_store\_id) | ID of the identity store to sync; defaults to the first store | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the CloudFormation stack | `string` | `"aws-google-sso-sync"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region in which to deploy the Lambda; defaults to current | `string` | `null` | no |
| <a name="input_scim_endpoint_access_token"></a> [scim\_endpoint\_access\_token](#input\_scim\_endpoint\_access\_token) | Access token for AWS SCIM provisioner | `string` | n/a | yes |
| <a name="input_scim_endpoint_url"></a> [scim\_endpoint\_url](#input\_scim\_endpoint\_url) | URL for AWS SCIM provisioner | `string` | n/a | yes |
| <a name="input_semantic_version"></a> [semantic\_version](#input\_semantic\_version) | Version of SSOSync to deploy | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to created resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stack_id"></a> [stack\_id](#output\_stack\_id) | ID of the created CloudFormation stack |
| <a name="output_stack_outputs"></a> [stack\_outputs](#output\_stack\_outputs) | Outputs from the CloudFormation stack |
<!-- END_TF_DOCS -->
