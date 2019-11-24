# Azure Storage の Management Policy のサンプル

WIP

## 何が出来るの??

+ Azure Blob Storage の機能の一つである Lifecycle を使ってみます 
+ 公式ドキュメント
  + https://docs.microsoft.com/en-us/azure/storage/blobs/storage-lifecycle-management-concepts?tabs=azure-portal#examples


## 準備

+ 作業用のコンテナを起動 ---> :whale:

```
sh docker-build-run.sh
```

+ :whale: CLI 上で Azure にログイン

```
az login
```

+ 登録しているサブスクリプションの確認

```
az account list
OR
az account list -o table
```


+ :whale: サブスクリプションの設定

```
_s_id='{上記でSubscriptionIdの項のもの}'

az account set --subscription ${_s_id}
```

+ 再度、サブスクリプションの確認
  + 任意のサブスクリプションの isDefault が True になれば OK

```
az account list -o table
```



## 実際に Terraform を使用して、リソースを作成していく

+ :whale: Terraform の 初期設定

```
terraform init
```

+ :whale: Terraform コマンドによるチェック

```
terraform plan
```


+ :whale: Terraform コマンドの本番反映

```
terraform apply
```

## リソースの削除

+ :whale: Terraform コマンドによるリソース削除

```
terraform destroy
```
