resource "random_string" "asa-suffix" {
  length  = "8"
  upper   = false
  lower   = true
  number  = false
  special = false
}

resource "azurerm_storage_account" "asa_default" {
  name                     = "${lookup(var.storage, "asa_name")}${random_string.asa-suffix.id}"
  resource_group_name      = "${azurerm_resource_group.arg_default.name}"
  location                 = "${lookup(var.common, "rsg_location")}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "asc_default" {
  name                  = "${lookup(var.storage, "asc_name")}"
  # resource_group_name   = "${azurerm_resource_group.arg_default.name}"
  storage_account_name  = "${azurerm_storage_account.asa_default.name}"
  container_access_type = "private"
}

# resource "azurerm_storage_blob" "asb_default_01" {
#   name                   = "penguin_01.png"
#   # resource_group_name    = "${azurerm_resource_group.arg_default.name}"
#   storage_account_name   = "${azurerm_storage_account.asa_default.name}"
#   storage_container_name = "${azurerm_storage_container.asc_default.name}"
#   type                   = "Block"
#   source                 = "images/irasutoya/penguin/animal_chara_computer_penguin.png"
# }
# resource "azurerm_storage_blob" "asb_default_02" {
#   name                   = "sample/penguin_02.png"
#   resource_group_name    = "${azurerm_resource_group.arg_default.name}"
#   storage_account_name   = "${azurerm_storage_account.asa_default.name}"
#   storage_container_name = "${azurerm_storage_container.asc_default.name}"
#   type                   = "Block"
#   source                 = "images/irasutoya/penguin/animal_chara_smartphone_penguin.png"
# }

resource "azurerm_storage_blob" "asb_default_03" {
  count = "${length(var.image-hiyoko)}"

  # same version
  name = "sample03/hiyoko/${element(var.image-hiyoko, count.index)}"
  # # rename version
  # name = "sample03/hiyoco-${lookup(var.image-hiyoko, count.index)}"

  # resource_group_name    = "${azurerm_resource_group.arg_default.name}"
  storage_account_name   = "${azurerm_storage_account.asa_default.name}"
  storage_container_name = "${azurerm_storage_container.asc_default.name}"
  type                   = "Block"
  source                 = "images/irasutoya/hiyoko/${element(var.image-hiyoko, count.index)}"
}