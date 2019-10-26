resource "azurerm_storage_account" "asa_default" {
  name                     = "hoge"
  resource_group           = "${azurerm_resource_group.arg_default.name}"
  location                 = "${lookup(var.common, "rsg_location")}"
  account_tier             = "Standard"
  account_replication_type = "LTS"

}