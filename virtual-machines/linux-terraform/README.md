# Create Linux machines in Azure using Terrafrom

## Official Document

+ Terraform / azurerm_linux_virtual_machine
  + https://www.terraform.io/docs/providers/azurerm/r/linux_virtual_machine.html

## Preparation

+ Terraform
  + v0.12.x ~
+ Azure Provider
  + 2.0.0


## Create VM

```
git clone https://github.com/iganari/package-azure.git
cd package-azure/virtual-machines/linux-terraform
```

+ Auth Azure

```
az login
```

+ Check Your Curent tenantId

```
az account show
```

+ Terraform Build

```
terraform init
terraform validate
terraform plan
terraform apply
```
