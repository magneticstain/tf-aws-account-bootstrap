admin_role_name = "admin"
admin_role_trust_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": "arn:aws:iam::509915386432:user/jcarlson"
      },
      "Effect": "Allow",
      "Sid": "XaccountAccessPrimaryUser"
    }
  ]
}
EOF
admin_role_policy_name_prefix = "admin-role-policy-"
admin_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAssumeRole",
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullAccessAnalyzer",
      "Action": "access-analyzer:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullBudgets",
      "Action": "budgets:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullCloudFront",
      "Action": "cloudfront:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullCloudtrail",
      "Action": "cloudtrail:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullConfig",
      "Action": "config:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullCostExplorer",
      "Action": "ce:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullDynamoDB",
      "Action": [
        "application-autoscaling:DeregisterScalableTarget",
        "dynamodb:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullEC2",
      "Action": "ec2:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullELB",
      "Action": "elasticloadbalancing:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "RestrictedIAM",
      "Action": [
        "iam:AddUserToGroup",
        "iam:AttachGroupPolicy",
        "iam:AttachRolePolicy",
        "iam:AttachUserPolicy",
        "iam:ChangePassword",
        "iam:CreateAccessKey",
        "iam:CreateAccountAlias",
        "iam:CreateGroup",
        "iam:CreatePolicy",
        "iam:CreatePolicyVersion",
        "iam:CreateRole",
        "iam:CreateServiceLinkedRole",
        "iam:CreateUser",
        "iam:CreateVirtualMFADevice",
        "iam:DeactivateMFADevice",
        "iam:DeleteAccessKey",
        "iam:DeleteAccountAlias",
        "iam:DeleteAccountPasswordPolicy",
        "iam:DeleteGroup",
        "iam:DeleteGroupPolicy",
        "iam:DeleteInstanceProfile",
        "iam:DeletePolicy",
        "iam:DeletePolicyVersion",
        "iam:DeleteRole",
        "iam:DeleteRolePolicy",
        "iam:DeleteUser",
        "iam:DeleteUserPolicy",
        "iam:DeleteVirtualMFADevice",
        "iam:DetachGroupPolicy",
        "iam:DetachRolePolicy",
        "iam:DetachUserPolicy",
        "iam:EnableMFADevice",
        "iam:GenerateCredentialReport",
        "iam:GenerateOrganizationsAccessReport",
        "iam:GenerateServiceLastAccessedDetails",
        "iam:GetAccessKeyLastUsed",
        "iam:GetAccountAuthorizationDetails",
        "iam:GetAccountEmailAddress",
        "iam:GetAccountName",
        "iam:GetAccountPasswordPolicy",
        "iam:GetAccountSummary",
        "iam:GetCredentialReport",
        "iam:GetGroup",
        "iam:GetGroupPolicy",
        "iam:GetInstanceProfile",
        "iam:GetLoginProfile",
        "iam:GetMFADevice",
        "iam:GetOrganizationsAccessReport",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:GetRole",
        "iam:GetRolePolicy",
        "iam:GetServiceLastAccessedDetails",
        "iam:GetServiceLastAccessedDetailsWithEntities",
        "iam:GetServiceLinkedRoleDeletionStatus",
        "iam:GetUser",
        "iam:GetUserPolicy",
        "iam:ListAccessKeys",
        "iam:ListAccountAliases",
        "iam:ListAttachedGroupPolicies",
        "iam:ListAttachedRolePolicies",
        "iam:ListAttachedUserPolicies",
        "iam:ListEntitiesForPolicy",
        "iam:ListGroupPolicies",
        "iam:ListGroups",
        "iam:ListGroupsForUser",
        "iam:ListInstanceProfileTags",
        "iam:ListInstanceProfiles",
        "iam:ListInstanceProfilesForRole",
        "iam:ListMFADeviceTags",
        "iam:ListMFADevices",
        "iam:ListPolicies",
        "iam:ListPoliciesGrantingServiceAccess",
        "iam:ListPolicyTags",
        "iam:ListPolicyVersions",
        "iam:ListRolePolicies",
        "iam:ListRoleTags",
        "iam:ListRoles",
        "iam:ListSigningCertificates",
        "iam:ListSTSRegionalEndpointsStatus",
        "iam:ListUserPolicies",
        "iam:ListUserTags",
        "iam:ListUsers",
        "iam:ListVirtualMFADevices",
        "iam:PassRole",
        "iam:PutGroupPolicy",
        "iam:PutRolePolicy",
        "iam:PutUserPolicy",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:RemoveUserFromGroup",
        "iam:ResetServiceSpecificCredential",
        "iam:SetDefaultPolicyVersion",
        "iam:SetSTSRegionalEndpointStatus",
        "iam:SetSecurityTokenServicePreferences",
        "iam:SimulateCustomPolicy",
        "iam:SimulatePrincipalPolicy",
        "iam:TagInstanceProfile",
        "iam:TagMFADevice",
        "iam:TagPolicy",
        "iam:TagRole",
        "iam:TagUser",
        "iam:UntagInstanceProfile",
        "iam:UntagMFADevice",
        "iam:UntagPolicy",
        "iam:UntagRole",
        "iam:UntagUser",
        "iam:UpdateAccessKey",
        "iam:UpdateAccountEmailAddress",
        "iam:UpdateAccountName",
        "iam:UpdateAccountPasswordPolicy",
        "iam:UpdateAssumeRolePolicy",
        "iam:UpdateGroup",
        "iam:UpdateRole",
        "iam:UpdateRoleDescription",
        "iam:UpdateServiceSpecificCredential",
        "iam:UpdateUser"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullAwsOrganizations",
      "Action": "organizations:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullRoute53",
      "Action": [
        "route53:*",
        "route53resolver:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "FullSecurityHub",
      "Action": "securityhub:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "RestrictedS3",
      "Action": [
        "s3:Create*",
        "s3:Describe*",
        "s3:Delete*",
        "s3:Get*",
        "s3:List*",
        "s3:Put*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
