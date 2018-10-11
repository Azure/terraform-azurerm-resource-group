output "resource_group_id" {
  description = "Get the ID of created/updated resource group"
  value       = ["${azurerm_resource_group.resource_group.id}"]
}

output "resource_group_name" {
  description = "Get the name of created/updated Resource group"
  value       = ["${azurerm_resource_group.resource_group.name}"]
}
