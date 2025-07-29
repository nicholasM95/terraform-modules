terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.7.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
