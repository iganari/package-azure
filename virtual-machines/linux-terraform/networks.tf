locals {
  network_name          = "hogehoge"
  network_address       = "10.0.0.0/16"
  subnet_name           = "hogehoge"
  subnet_address        = "10.0.2.0/24"
  interface_name        = "vm-linux-${lookup(var.common, "name")}-interface"
  interface_ipaddr_name = "vm-linux-${lookup(var.common, "name")}-ipaddr"
}


resource "azurerm_virtual_network" "pkg-azure-vm-linux" {
  name                = local.network_name
  address_space       = [local.network_address]
  location            = azurerm_resource_group.pkg-azure-vm-linux.location
  resource_group_name = azurerm_resource_group.pkg-azure-vm-linux.name
}

resource "azurerm_subnet" "pkg-azure-vm-linux" {
  name                 = local.subnet_name
  address_prefix       = local.subnet_address
  resource_group_name  = azurerm_resource_group.pkg-azure-vm-linux.name
  virtual_network_name = azurerm_virtual_network.pkg-azure-vm-linux.name
}

resource "azurerm_network_interface" "pkg-azure-vm-linux" {
  name                = local.interface_name
  location            = azurerm_resource_group.pkg-azure-vm-linux.location
  resource_group_name = azurerm_resource_group.pkg-azure-vm-linux.name

  ip_configuration {
    name                          = local.interface_ipaddr_name
    subnet_id                     = azurerm_subnet.pkg-azure-vm-linux.id
    private_ip_address_allocation = "Dynamic"
  }
}
