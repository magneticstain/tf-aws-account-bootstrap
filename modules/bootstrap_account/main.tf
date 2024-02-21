# Generate all resources required for a new AWS account

#######################
# IAM
#######################
## Personal Accounts
### Policy
resource "aws_iam_policy" "admin-policy" {
  name_prefix = var.admin_policy_name_prefix

  description = "IAM policy used for soft admins within the account."
  policy = var.admin_policy
}

### Group
resource "aws_iam_group" "admin-group" {
  name = var.admin_group_name
}

resource "aws_iam_group_policy_attachment" "admin-policy-attachment" {
  group      = aws_iam_group.admin-group.name
  policy_arn = aws_iam_policy.admin-policy.arn
}

### User
resource "aws_iam_user" "admin-user" {
  name = var.admin_username
}

resource "aws_iam_group_membership" "admin-user-grp-membership" {
  name  = "${aws_iam_user.admin-user.name}-${aws_iam_group.admin-group.name}-group-membership"
  group = aws_iam_group.admin-group.name
  users = [aws_iam_user.admin-user.name]
}

## MFA Admin Role
### Policy
resource "aws_iam_policy" "mfa-admin-role-policy" {
  name_prefix = var.mfa_admin_jump_policy_name_prefix

  description = "IAM policy used for allowing users to assume a dedicated role for further role linking."
  policy = var.mfa_admin_jump_policy
}

### Role
resource "aws_iam_role" "mfa-admin-role" {
  name = var.mfa_admin_jump_role_name
  assume_role_policy = var.mfa_admin_jump_assume_role_policy
}

resource "aws_iam_role_policy_attachment" "mfa-admin-role-policy-attach" {
  role       = aws_iam_role.mfa-admin-role.name
  policy_arn = aws_iam_policy.mfa-admin-role-policy.arn
}