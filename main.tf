terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {}
}

provider "aws" {
  region  = "us-east-1"
}

module "bootstrap-account" {
    source = "./modules/bootstrap_account"
    admin_role_name = var.admin_role_name
    admin_role_trust_policy = var.admin_role_trust_policy
    admin_role_policy_name_prefix = var.admin_role_policy_name_prefix
    admin_role_policy = var.admin_role_policy
}