variable "resource_group" {
  type = "map"
  default = {
    name     = "count-test-1912-tmf"
    location = "eastus"
  }
}

variable "network" {
  type = "map"
  default = {
    name     = "count-test-network"
    location = "eastus"
    address  = "10.0.0.0/16"
  }
}

variable "subnet" {
  type = "map"
  default = {
    name    = "count-test-subnet"
    address = "10.0.2.0/24"
  }
}