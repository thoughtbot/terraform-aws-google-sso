resource "aws_serverlessapplicationrepository_cloudformation_stack" "this" {
  application_id   = local.application_id
  capabilities     = ["CAPABILITY_IAM"]
  name             = var.name
  semantic_version = var.semantic_version
  tags             = var.tags

  parameters = {
    GoogleAdminEmail        = var.google_admin_email
    GoogleCredentials       = var.google_credentials
    GoogleGroupMatch        = var.google_group_match
    GoogleUserMatch         = var.google_user_match
    IdentityStoreID         = local.identity_store_id
    IgnoreGroups            = var.google_ignore_groups
    IgnoreUsers             = var.google_ignore_users
    IncludeGroups           = ""
    Region                  = local.region
    SCIMEndpointAccessToken = var.scim_endpoint_access_token
    SCIMEndpointUrl         = var.scim_endpoint_url
  }
}

locals {
  region = coalesce(var.region, data.aws_region.current.name)

  application_id = coalesce(
    var.application_id,
    "arn:aws:serverlessrepo:us-east-2:004480582608:applications/SSOSync",
  )

  identity_store_id = coalesce(
    var.identity_store_id,
    tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0],
  )
}


data "aws_region" "current" {}

data "aws_ssoadmin_instances" "this" {}
