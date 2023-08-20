variable "admin_username" {
    type = string
    description = "Username for initial admin account"
}

variable "admin_group_name" {
    type = string
    description = "Name for user group containing admin accounts"
}

variable "admin_policy_name_prefix" {
    type = string
    description = "Prefix used for the ame of IAM policy being applied to the admin group, e.g. admin-policy-"
}

variable "admin_policy" {
    type = string
    description = "IAM policy manifest for admin policy"
}