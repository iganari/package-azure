# ref: https://docs.microsoft.com/ja-jp/azure/virtual-machines/linux/terraform-create-complete-vm

resource "azurerm_resource_group" "arg_count_test" {
  name     = var.rg_name
  location = "eastus"
}


resource "azurerm_virtual_network" "avn_count_test" {
  name          = "${lookup(var.network, "name")}"
  address_space = ["${lookup(var.network, "address")}"]
  location      = "${lookup(var.network, "location")}"

  resource_group_name = azurerm_resource_group.arg_count_test.name
}

resource "azurerm_subnet" "as_count_test" {
  name           = "${lookup(var.subnet, "name")}"
  address_prefix = "${lookup(var.subnet, "address")}"

  resource_group_name  = azurerm_resource_group.arg_count_test.name
  virtual_network_name = azurerm_virtual_network.avn_count_test.name

}


