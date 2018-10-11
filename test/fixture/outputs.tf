output "resource_group_id" {
  description = "Get the id of created/updated resource group"
  value       = ["${module.resourcegroup.resource_group_id}"]
}
