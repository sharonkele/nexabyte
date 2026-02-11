terraform {
    required_version = ">=1.0"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = ">=5.12"
      }
    }

    backend "s3" {
        bucket = "terraform-state-so25aco"
        key = "nexabyte-dev"
        region = "eu-west-1"
    }
}