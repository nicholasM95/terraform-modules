terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.49.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
