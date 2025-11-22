terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.13.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "6.22.1"
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
