# Terraform Sample

## 何が出来るの??

+ Azure の Blob Storage にローカルのイメージを Terraform を通じてアップロードします
  + [Azure Storageとは?](../README.md) 

## 準備

+ 作業用のコンテナを起動 ---> :whale:

+ :whale: CLI 上で Azure にログイン

```
az login
```

+ 登録しているサブスクリプションの確認

```
az account list
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

+ Terraform の 初期設定

```
terraform init
```



+ Plan

```
terraform plan
```


+ Apply

```
terraform apply
```

## リソースの削除

```
terraform destroy
```


## 今後、実装予定

+ ライフサイクルについて設定を入れたいので、 Issue 化しています
    + https://github.com/iganari/package-azure/issues/3
