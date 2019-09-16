### Resource Groups 
resource "azurerm_resource_group" "arg_default" {
    name     = "${lookup(var.dns, "arg_name")}"
    location = "${lookup(var.dns, "arg_location")}"  
}
