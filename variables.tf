variable "admin_username" {
    type = string
    description = "Username for initial admin account"
    default = ""
    nullable = false
}

variable "admin_group_name" {
    type = string
    description = "Name for user group containing admin accounts"
    default = ""
    nullable = false
}

variable "admin_policy_name_prefix" {
    type = string
    description = "Prefix used for the name of IAM policy being applied to the admin group, e.g. admin-policy-"
    default = ""
    nullable = false
}

variable "admin_policy" {
    type = string
    description = "IAM policy manifest for admin policy"
    default = ""
    nullable = false
}

variable "mfa_admin_jump_role_name" {
    type = string
    description = "Name for IAM role used for MFA jumps to admin xaccount roles"
    default = ""
    nullable = false
}

variable "mfa_admin_jump_assume_role_policy" {
    type = string
    description = "Trust relationship policy for MFA admin jump role"
    default = ""
    nullable = false
}

variable "mfa_admin_jump_policy_name_prefix" {
    type = string
    description = "Prefix used for the name of IAM policy being applied to the MFA admin jump role"
    default = ""
    nullable = false
}

variable "mfa_admin_jump_policy" {
    type = string
    description = "IAM policy for MFA admin jump role"
    default = ""
    nullable = false
}