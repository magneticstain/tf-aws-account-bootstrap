# tf-aws-account-bootstrap

Terraform plans for bootstrapping a new AWS account with the required resources.

## Supported Features

* S3 backend
* State locking via DynamoDB table
* Modules ready to go, out-of-the-box

## Usage

### Bootstrap the Prerequisite Resources

The plans use S3 as a backend and DynamoDB for state tracking. A script is included to easily generate the resources needed to support this.

```bash
./utils/generate_backend.sh
```

### Set TF Vars

Generate a `terraform.tfvars` file and fill in the variables as approriate.

```hcl
ami_id = "<EC2_AMI>"  # any AMI of your choice can be used
key_pair_name = "<EC2_SSH_KEY_PAIR_NAME>"
subnets = [<SUBNETS_FOR_LBS>]
vpc = "<VPC>"
```

Example:

```hcl
ami_id = "ami-053b0d53c279acc90"  # Ubuntu Server 22.04 LTS
key_pair_name = "default"
subnets = ["subnet-123456789", "subnet-987654321"]
vpc = "vpc-12345abcde"
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
