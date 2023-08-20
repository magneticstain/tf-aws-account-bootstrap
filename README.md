# tf-aws-account-bootstrap

Terraform plans for bootstrapping a new AWS account with the required resources.

## Supported Features

* S3 backend
* State locking via DynamoDB table
* Modules ready to go, out-of-the-box

### Roadmap

* [ ] Add support for generating and outputting access keys

## Usage

### Bootstrap the Prerequisite Resources

The plans use S3 as a backend and DynamoDB for state tracking. A script is included to easily generate the resources needed to support this.

```bash
./utils/generate_backend.sh
```

Open it in your favorite text editor and update the `PROJ_NAME` variable to the name of your project.

```bash
PROJ_NAME="<PROJECT_NAME>" ## !!! UPDATE ME !!!
```

Save and then run in your shell using the command above.

#### Update `backend.tfvars` File

Take the names of the S3 bucket and DynamoDB table from the backend generator script and use them to update `backend.tfvars`.

Example:

```hcl
bucket = "tf-bash-aws-tf-template"
key    = "terraform.tfstate"
region = "us-east-1"

dynamodb_table = "tf-bash-aws-tf-template"
```

### Set TF Vars

Generate a `terraform.tfvars` file and fill in the variables as approriate.

```hcl
admin_username = "<USERNAME>"
admin_group_name = "<GROUP_NAME>"
admin_policy_name_prefix = "<POLICY_NAME>"
admin_policy = <<EOF
    <IAM_POLICY>
EOF
```

Example:

```hcl
admin_username = "admin"
admin_group_name = "admins"
admin_policy_name_prefix = "admin-policy-"
admin_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1692554267682",
      "Action": [
        "ec2:DescribeInstances"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
```

### Plan and Apply Plans

A Make file has been included to make running these plans easier. There is no need to initialize the environment, or any other prerequesite work, prior to running these commands.

#### Plan

```bash
make plan
```

#### Apply

```bash
make apply
```
