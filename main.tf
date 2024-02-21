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
    admin_username = var.admin_username
    admin_group_name = var.admin_group_name
    admin_policy_name_prefix = var.admin_policy_name_prefix
    admin_policy = var.admin_policy
    mfa_admin_jump_role_name = var.mfa_admin_jump_role_name
    mfa_admin_jump_assume_role_policy = var.mfa_admin_jump_assume_role_policy
    mfa_admin_jump_policy_name_prefix = var.mfa_admin_jump_policy_name_prefix
    mfa_admin_jump_policy = var.mfa_admin_jump_policy
}
