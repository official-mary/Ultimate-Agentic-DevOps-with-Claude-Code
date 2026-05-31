# Remote state backend configuration (S3)
#
# HOW TO USE:
# 1. On first run, leave this block commented out and run `terraform init` + `terraform apply`
#    to bootstrap your infrastructure (including any state bucket you create separately).
# 2. Create an S3 bucket to store Terraform state (e.g. <your-org>-tf-state-<account-id>).
# 3. Uncomment the backend block below, fill in your bucket name and key.
# 4. Run `terraform init -migrate-state` to move local state to S3.
#
# terraform {
#   backend "s3" {
#     bucket         = "your-tf-state-bucket-name"   # <-- replace with your state bucket
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "eu-north-1"
#     encrypt        = true
#   }
# }
