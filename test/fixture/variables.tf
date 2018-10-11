variable "location" {
  description = "The location/region where the asg will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type        = "string"
  default     = "westus"
}

variable "tags" {
  description = "The tags to associate with your asg."
  type        = "map"

  default = {
    tag1 = "TestTag1"
    tag2 = "TestTag2"
  }
}
