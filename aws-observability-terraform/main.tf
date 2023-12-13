locals {
  # these local variables replace the tfvars of the same name. Since they aren't
  # secrets, it's better to keep them in the code rather than in tfvars for gitops
  sumologic_environment                   = "us2"
  sumologic_organization_id               = "00000000003297D8"
  sumologic_folder_installation_location  = "Admin Recommended Folder" 
  sumologic_folder_share_with_org         = false
}

#
# The below module is used to install apps, metric rules, Field extraction rules, Fields and Monitors.
# NOTE - The "app-modules" should be installed per Sumo Logic organization.
#
module "sumo-module" {
  source = "./app-modules"

  access_id                     = var.sumologic_access_id
  access_key                    = var.sumologic_access_key
  environment                   = local.sumologic_environment
  folder_installation_location  = local.sumologic_folder_installation_location
  folder_share_with_org         = local.sumologic_folder_share_with_org 
  json_file_directory_path      = dirname(path.cwd)
  sumologic_organization_id     = local.sumologic_organization_id
}

#
# The below module is used to install AWS and Sumo Logic resources to collect logs and metrics from AWS into Sumo Logic.
# NOTE - For multi account and multi region deployment, copy the module and provide different aws provider for region and account.
#
module "staging-collection-module" {
  source = "./source-module"

  providers = {
    aws = aws.staging
  }

  access_id                 = var.sumologic_access_id
  access_key                = var.sumologic_access_key
  aws_account_alias         = "staging"
  environment               = local.sumologic_environment  
  sumologic_organization_id = local.sumologic_organization_id
}