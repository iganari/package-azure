variable "resource_group_name" {
  default = "iganari-aks-test"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}

variable "cluster_name" {
  defautl = "iganari-aks-test"
}

variable "dns_prefix" {
  default = "WIP"
}

variable "agent_count" {
  default = "WIP"
}