locals {
  az = {
    app          = var.AZ_CLIENT_ID
    tenant       = var.AZ_TENANT_ID
    secret       = var.AZ_CLIENT_SECRET
    subscription = var.AZ_SUBSCRIPTION_ID
  }

  common_tags = {
    Environment = ""
    Company     = ""
    Project     = ""
  }

  rg = {
    location = var.location
    name     = var.rg_name
  }
}