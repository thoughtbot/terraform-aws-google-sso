variable "application_id" {
  description = "ID of the serverless application to deploy; defaults to official SSOSync"
  type        = string
  default     = null
}

variable "google_admin_email" {
  description = "Email address of the Google admin who created the service account"
  type        = string
}

variable "google_credentials" {
  description = "Service account credentials for syncing users and groups"
  sensitive   = true
  type        = string
}

variable "google_group_match" {
  description = "Pattern for finding which groups to sync (default all)"
  type        = string
  default     = ""
}

variable "google_ignore_groups" {
  description = "Google groups to ignore (default none)"
  type        = string
  default     = ""
}

variable "google_ignore_users" {
  description = "Google users to ignore (default none)"
  type        = string
  default     = ""
}

variable "google_user_match" {
  description = "Pattern for finding which users to sync (defaults to all in matched groups)"
  type        = string
  default     = ""
}

variable "identity_store_id" {
  description = "ID of the identity store to sync; defaults to the first store"
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the CloudFormation stack"
  type        = string
  default     = "aws-google-sso-sync"
}

variable "region" {
  description = "AWS region in which to deploy the Lambda; defaults to current"
  type        = string
  default     = null
}

variable "scim_endpoint_access_token" {
  description = "Access token for AWS SCIM provisioner"
  type        = string
  sensitive   = true
}

variable "scim_endpoint_url" {
  description = "URL for AWS SCIM provisioner"
  type        = string
  sensitive   = true
}

variable "semantic_version" {
  description = "Version of SSOSync to deploy"
  type        = string
}

variable "tags" {
  description = "Tags to apply to created resources"
  type        = map(string)
  default     = {}
}
