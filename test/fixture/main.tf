resource "random_id" "rg_name" {
  byte_length = 8
}

module "resourcegroup" {
  source              = "../../"
  resource_group_name = "${random_id.rg_name.hex}"
  location            = "${var.location}"
  tags                = "${var.tags}"
}
