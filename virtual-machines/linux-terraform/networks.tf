resource "azurerm_virtual_network" "pkg-azure-vm-linux" {
  name = "hogehoge"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.pkg-azure-vm-linux.location
  resource_group = azurerm_resource_group.pkg-azure-vm-linux.name
}
