# Generate all resources required for a new AWS account

#######################
# IAM
#######################
## Admin Role
### Policy
resource "aws_iam_policy" "admin-role-policy" {
  name_prefix = var.admin_role_policy_name_prefix

  description = "IAM policy used for soft admins within the account."
  policy = var.admin_role_policy
}

### Trust Policy


### Role
resource "aws_iam_role" "admin-role" {
  name = var.admin_role_name
  assume_role_policy = var.admin_role_trust_policy
}
