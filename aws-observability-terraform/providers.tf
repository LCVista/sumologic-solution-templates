provider "sumologic" {
  environment = local.sumologic_environment
  access_id   = var.sumologic_access_id
  access_key  = var.sumologic_access_key
  admin_mode  = local.sumologic_install_folder == "Personal Folder" ? false : true
}

provider "aws" {
  region = "us-west-2"
  profile = "default" # local aws cli auth profile
  alias = "staging"
}