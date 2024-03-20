locals {
  az = {
    app = var.AZ_APPID
    tenant = var.AZ_TENANTID
    secret = var.AZ_SECRET
    subs = var.AZ_SUBSID
    location = VAR.Region
  }
  common_tags = {
    ENV = var.Environment
    Project = "${var.Company}-${var.Project}"
  }

  rg = upper("${var.rg-nameprefix}-${var.Project}")
}