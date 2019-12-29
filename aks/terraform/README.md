# Terraform で AKS を構築する

## ドキュメント

+ Terraform
  + https://www.terraform.io/docs/providers/azurerm/r/container_service.html
+ Azure
  + Tutorial: Create a Kubernetes cluster with Azure Kubernetes Service using Terraform
  + https://docs.microsoft.com/en-us/azure/terraform/terraform-create-k8s-cluster-with-tf-and-aks

## 実行方法 (簡易版)

+ Docker コンテナの起動 ---> :whale:

```
sh docker-build-run.sh
```

+ :whale: 秘密鍵および公開鍵の作成

```
ssh-keygen -t rsa -b 4096 -f _ssh/id_rsa
```

+ :whale: Azure との認証

```
WIP
```

+ :whale: Terraform の実行

```
terraform init
```
```
terraform validate
```
```
terraform plan
```
```
terraform apply
```