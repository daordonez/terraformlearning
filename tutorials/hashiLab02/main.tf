#Usually 'main.tf' file is intended to define resources. In this module either providers and terraform configuration
#have been splitted in two different files.

resource "random_pet" "pet" {
  keepers = {
    ami_id = var.pet_name_prefix
  }
}

resource "aws_s3_bucket" "sample" {
  bucket = "s3-${random_pet.pet.id}"

  tags = {
    public_bucket = false
  }
}