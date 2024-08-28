# In this lab, terraform.tf file defines the expected configuration specifally for the providers such as random and aws,
# on its specific version
terraform {
  required_providers {
    random = {
        source = "hashicorp/random" # where the provider comes from ,hashicorp in this case
        version = "3.1.0" # provider version that will be download once terraform init command has been landed
    }

    aws = {
        source = "hashicorp/aws" # where the provider comes from ,hashicorp in this case
        version = ">= 4.5.0"
    }
  }

  required_version = "~> 1.2" # It refers to Terraform binaries spcifying 1.2 such as minium allowed version, but it allows above versions
}