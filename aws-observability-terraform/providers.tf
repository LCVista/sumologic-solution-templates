provider "sumologic" {
  environment = local.sumologic_environment
  access_id   = var.sumologic_access_id
  access_key  = var.sumologic_access_key
  admin_mode  = local.sumologic_folder_installation_location == "Personal Folder" ? false : true
}

provider "aws" {
  region = "us-west-2"
  alias = "staging"
  access_key = var.staging_aws_access_key
  secret_key = var.staging_aws_secret_key
}