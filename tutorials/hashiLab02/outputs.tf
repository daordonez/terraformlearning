# The outputs.tf file in Terraform is used to define output values that are generated by your Terraform configuration. Output values allow you to retrieve important information about your infrastructure resources, such as IP addresses or endpoint URLs, after they have been created.

output "pet_name" {
  description = "The random pet name"
  value       = random_pet.pet.id
}