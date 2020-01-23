# Terraform で AKS を構築する

## 公式ドキュメント

+ Terraform
  + https://www.terraform.io/docs/providers/azurerm/r/container_service.html
+ Azure
  + Tutorial: Create a Kubernetes cluster with Azure Kubernetes Service using Terraform
  + https://docs.microsoft.com/en-us/azure/terraform/terraform-create-k8s-cluster-with-tf-and-aks
  + 今回はこちらをやっていきます。

## 準備

+ az コマンドが使える環境

```
az --version
```

+ 上記が難しい場合は以下を参照して下さい

<details>
<summary>docker コマンドが使える場合</summary>

```
cd prepare
sh docker-build-run.sh
```


</details>

## バケットの作成

```
az create bucket hogehoge
```


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
