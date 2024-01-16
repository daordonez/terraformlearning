locals {
  az = {
    app          = var.AZ_APPID
    tenant       = var.AZ_TENANTID
    secret       = var.AZ_SECRET
    subscription = var.AZ_SUBSID
  }

  common_tags = {
    Environment = var.environment
    Company     = var.company
    Project     = "${var.company}-${var.project_name}"
    BillingCode = var.billing_code
  }

  location = var.rg_location
}
