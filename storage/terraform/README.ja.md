# Terraform を用いた Azure Storage への画像アップロードのサンプル

## 何が出来るの??

+ Azure の Blob Storage にローカルのイメージを Terraform を通じてアップロードします。
  + [Azure Storageとは?](../README.md) 
+ 使用する画像
  + [いらすとや](https://www.irasutoya.com/) さんからお借りしています。
+ はてなブログに実行方法を書きました :pen:
  + http://iganari.hatenablog.com/entry/2019/10/28/051438

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

```
terraform destroy
```


## 今後、実装予定

+ ライフサイクルについて設定を入れたいので、 Issue 化しています :pray:
    + https://github.com/iganari/package-azure/issues/3
