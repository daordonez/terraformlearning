# The variables.tf file in Terraform is used to define input variables for your Terraform configuration. Input variables allow you to parameterize your infrastructure resources, making your configuration more flexible and reusable.

variable "pet_name_prefix" {
  type = string
  description = "A string to prefix the name with."
  default = "lab02"
}