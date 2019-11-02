resource "azurerm_resource_group" "arg_default" {
  name     = "${lookup(var.common, "rsg_name")}"
  location = "${lookup(var.common, "rsg_location")}"
}