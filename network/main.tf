# ref: https://docs.microsoft.com/ja-jp/azure/virtual-machines/linux/terraform-create-complete-vm

resource "azurerm_resouce_group" "arg_count_test" {
  name = "hogehoge"
  location = "eastus"
}


resource "azurerm_virtual_network" "avn_count_test" {
  name = "hogehoge"
  address_space = ["10.0.0.0/16"]
  location = "eastus"
  resource_group_name = azure_resource_group.arg_count_test.name
}

resource "azurerm_subnet" "as_count_test" {
  name = "subnet"
  resource_group_name = azure_resource_group.arg_count_test.name
  virtual_network_name = azure_virautl_network.avn_count_test.name
  address_prefix = "10.0.2.0/24"
}


