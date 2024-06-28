terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.35.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
