terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  #Line bellow reffers to terraform binaries version ( minimum supported )
  required_version = ">= 1.2.0"
}