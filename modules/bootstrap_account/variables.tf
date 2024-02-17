variable "admin_role_name" {
    type = string
    description = "Name for ARN role used for admin"
}

variable "admin_role_trust_policy" {
    type = string
    description = "Trust policy to allow xaccount access to admin role"
}

variable "admin_role_policy_name_prefix" {
    type = string
    description = "Prefix used for the ame of IAM policy being applied to the admin role"
}

variable "admin_role_policy" {
    type = string
    description = "IAM policy manifest for admin role policy"
}