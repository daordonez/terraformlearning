output "vmlinux-url" {
  description = "Describes the fully qualified name of the vm once created"
  value       = "http://${azurerm_linux_virtual_machine.lab01-vmLinux.public_ip_address}/index.html"
}