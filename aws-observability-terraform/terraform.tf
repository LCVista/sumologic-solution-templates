terraform {
  cloud {
    organization = "lcvista"
    workspaces {
      name = "sumologic-solution-templates"
    }
  }

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.16.2, < 6.0.0"
    }
    sumologic = {
      version = ">= 2.14.0"
      source  = "SumoLogic/sumologic"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
}