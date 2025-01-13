# terraform {
#   # backend "s3" {
#   #   bucket = "agwe-aws-terraform"
#   #   key    = "aws6-armageddon"
#   #   region = "ap-southeast-2"
#   #   encrypt = true
#   # }

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.77.0"
#     }
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

# Configure AWS Providers for both regions
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
}

module "virginia_vpc" {
  source = "./modules/vpc"
  providers = {
    aws = aws.virginia
  }

  network = var.virginia-network
}

module "tokyo_vpc" {
  source = "./modules/vpc"
  providers = {
    aws = aws.tokyo
  }

  network = var.tokyo-network
}