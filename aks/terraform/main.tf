terraform {
  version = "0.12.18"
}
# provider "azurerm"{
#   version = ""
# }

resource "azurerm_resource_group" "arg_aks"{
  name     = var.resource_group_name
  location = var.location 
}

resource "random_id" "rnd_suffix" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "alaw_aks" {
  name = "hoge"
  location = "hoge"
  resource_group_name = azurerm_resource_group.arg_aks
  sku = var.log_analytics_workspace_sku

}

resource "azurerm_log_analytics_solution" "alas_aks" {
  solution_name        = "ContainerInsights"
  location             = azurerm_log_analytics_workspace.alaw_aks.location
  resource_group_name  = azurerm_resource_group.arg_aks.name
  workspace_resource_id = azurerm_log_analytics_workspace.alaw_aks.id
  workspace_name = azurerm_log_analytics_workspace.alaw_aks.name

  plan {
    publisher = "Microsoft"
    product = "OMGallery/ContainerInsights"
  }
}