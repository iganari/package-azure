resource "azurerm_storage_blob" "asb_default" {
  name                   = "hogehoge"
  resource_group_name    = "${azurerm_resource_group.arg_default.arg_default.name}"
  storage_account_name   = "${azurerm_storage_account.asa_default}"
  storage_container_name = "${azurerm_storage_container.asc_default}"
  type                   = "blob"
  source                 = "hoggehoge"
}