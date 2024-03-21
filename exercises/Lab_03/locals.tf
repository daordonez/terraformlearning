locals {
  az = {
    app      = var.AZ_APPID
    tenant   = var.AZ_TENANTID
    secret   = var.AZ_SECRET
    subs     = var.AZ_SUBSID
    location = var.Region
  }
  common_tags = {
    ENV     = var.Environment
    Project = "${var.Company}-${var.Project}"
  }

  rg       = upper("${var.rg-nameprefix}-${var.Project}")
  g-prefix = var.Project
}