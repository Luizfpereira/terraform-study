terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "default"
}

module "network" {
  source = "../modules/network"

  region        = var.region
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
