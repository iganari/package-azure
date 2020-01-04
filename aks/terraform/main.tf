terraform {
  required_version = "0.12.18"
}
# provider "azurerm"{
#   version = "1.39.0"
# }

resource "azurerm_resource_group" "aks-test" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_id" "rnd_suffix" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "aks-test" {
  name                = "hoge"
  location            = "hoge"
  resource_group_name = azurerm_resource_group.aks-test
  sku                 = var.log_analytics_workspace_sku

}

resource "azurerm_log_analytics_solution" "aks-test" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.aks-test.location
  resource_group_name   = azurerm_resource_group.aks-test.name
  workspace_resource_id = azurerm_log_analytics_workspace.aks-test.id
  workspace_name        = azurerm_log_analytics_workspace.aks-test.name

  plan {
    publisher = "Microsoft"
    product   = "OMGallery/ContainerInsights"
  }
}

resource "azurerm_kubernetes_cluster" "aks-test" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks-test.location
  resource_group_name = azurerm_resource_group.aks-test.name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  # agent_pool_profile {
  #   os_type         = "Linux"
  #   count           = var.agent_count
  #   vm_size         = "Standard_DS1_v2"
  #   name            = "agentpool"
  # }


  default_node_pool {
    name = "agentpool"
    # count           = var.agent_count
    vm_size = "Standard_DS1_v2"
    # os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.aks-test.id
    }
  }



  tags = {
    Environment = "Development"
  }










}