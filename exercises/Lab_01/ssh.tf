resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

#To create new public Key identifier
resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = local.location
  parent_id = azurerm_resource_group.rg-01.id

  tags = local.common_tags
}

#Creating ssh key pair
resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}

