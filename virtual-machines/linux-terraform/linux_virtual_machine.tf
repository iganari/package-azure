locals {
  vm_name = "hogehoge"
  vm_size = "Standard"

  os_disk_cache      = "ReadWrite"
  os_disk_type       = "Standard_LRS"
  os_image_publisher = "Canonical"
  os_image_offer     = "UbuntuServer"
  os_image_sku       = "18.04-LTS"
  os_image_version   = "latest"
}

resource "azurerm_linux_virtual_machine" "pkg-azure-vm-linux" {
  name  = local.vm_name
  resource_group_name = azurerm_resource_group.pkg-azure-vm-linux.name
  location            = azurerm_resource_group.pkg-azure-vm-linux.location
  size                = local.vm_size
  network_interface_id = [
    azurerm_network_interface.pkg-azure-vm-linux.id,
  ]

  os_disk {
    caching              = local.os_disk_cache
    storage_account_type = local.os_disk_type
  }
  source_image_reference {
    publicher = local.os_image_publisher
    offer     = local.os_image_offer
    sku       = local.os_image_sku
    version   = local.os_image_version
  }

  # admin_username = ""
  # admin_ssh_key {
  #   username = ""
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }
}
