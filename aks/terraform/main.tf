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

resource "azurerm_kubernetes_cluster" "akc_aks" {
  name = var.cluster_name
  location = azurerm_resource_group.arg_aks.location
  resource_group_name = azurerm_resource_group.arg_aks.name
  dns_prefix = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name = "agentpool"
    couont = var.agent_count
    vm_size = "Standard_DS1_v2"
    os_type = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    oms_agent {
      enable = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.alaw_aks.id
    }
  }

  tags = {
    Environment = "Development"
  }










}