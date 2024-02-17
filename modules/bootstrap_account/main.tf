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
  name_prefix = "mfa-admin-role-policy-"

  description = "IAM policy used for allowing users to assume a dedicated role for further role linking."
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAssumeRole",
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
  EOF
}

### Role
resource "aws_iam_role" "mfa-admin-role" {
  name = "mfa-admin-jump"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "XaccountAccessPrimaryUser",
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::509915386432:user/josh"
      },
      "Condition": {
        "Bool": {
          "aws:multifactorAuthPresent": "true"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "mfa-admin-role-policy-attach" {
  role       = aws_iam_role.mfa-admin-role.name
  policy_arn = aws_iam_policy.mfa-admin-role-policy.arn
}