
provider "aws" {
  region  = var.aws_region
}

# terraform {
#   backend "s3" {
#     bucket         = "project-standford-infrastructure-versioning"
#     key            = "terraform_dev.tfstate"
#     region         = "eu-north-1"
#     dynamodb_table = "ps-tflocks"
#     encrypt = true
#     profile = "basalt"
#   }
# }