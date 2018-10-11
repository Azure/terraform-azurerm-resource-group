variable "resource_group_name" {
  description = "Default resource group name that the ASG will be created in."
  default     = "myapp-rg"
}

variable "location" {
  description = "The location/region where the rg will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type        = "string"
  default     = "westus"
}

variable "tags" {
  description = "The tags to associate with your resource group."
  type        = "map"

  default = {
    tag1 = ""
    tag2 = ""
  }
}
