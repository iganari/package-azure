resource "azurerm_resource_group" "pkg-azure-vm-linux" {
  name     = "vm-linux-${lookup(var.common, "name")}-resource-group"
  location = "West Europe" # Todo: tokyo
}
