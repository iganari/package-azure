resource "azurerm_storage_container" "asc_default" {
  name                  = "hogehoge"
  resource_group_name   = "${azurerm_resource_group.arg_default.name}"
  storage_account_name  = "${azurerm_storage_account.asa_default.name}"
  container_access_type = "private"
}