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
  account_kind             = "BlobStorage"
}

resource "azurerm_storage_container" "asc_default" {
  name = "${lookup(var.storage, "asc_name")}"
  # resource_group_name   = "${azurerm_resource_group.arg_default.name}"
  storage_account_name  = "${azurerm_storage_account.asa_default.name}"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "asb_hiyoko" {
  count = "${length(var.image-hiyoko)}"

  # same version
  name = "sample/hiyoko-${element(var.image-hiyoko, count.index)}"

  # resource_group_name    = "${azurerm_resource_group.arg_default.name}"
  storage_account_name   = "${azurerm_storage_account.asa_default.name}"
  storage_container_name = "${azurerm_storage_container.asc_default.name}"
  type                   = "Block"
  source                 = "images/irasutoya/hiyoko/${element(var.image-hiyoko, count.index)}"
}
# 
# # output "check_asb_default" {
# #   value = "${azurerm_storage_blob.asb_hiyoko}"
# # }




resource "azurerm_storage_blob" "asb_penguin" {
  storage_account_name   = "${azurerm_storage_account.asa_default.name}"
  storage_container_name = "${azurerm_storage_container.asc_default.name}"
  type                   = "Block"

  count  = "${length(var.image-penguin)}"
  name   = "sample/penguin-${element(var.image-penguin, count.index)}"
  source = "images/irasutoya/penguin/${element(var.image-penguin, count.index)}"
}

resource "azurerm_storage_management_policy" "policy_penguin" {
  storage_account_id = "${azurerm_storage_account.asa_default.id}"

  rule {
    name = "policy2penguin"   ## A rule name can contain any combination of alpha numeric characters.
    enabled = true
    filters {
      prefix_match = ["sample/penguin-"]
      blob_types = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than = 1
        tier_to_archive_after_days_since_modification_greater_than = 2
        delete_after_days_since_modification_greater_than = 3
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 30
      }
    }
  }
}