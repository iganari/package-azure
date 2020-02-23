# az command

## wip

+ 現在の設定情報を取得
  + tenantId とか見れる

```
az account show
```
```
$ az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "xxxxxxxxxxxxxxxxxxxxxxxxxx",
  "id": "xxxxxxxxxxxxxxxxxxxxxxxxxx",
  "isDefault": true,
  "managedByTenants": [],
  "name": "xxxxxxxxxxxxxxxxxxxxxxxxxx",
  "state": "Enabled",
  "tenantId": "xxxxxxxxxxxxxxxxxxxxxxxxxx",
  "user": {
    "name": "hogehoge@example.com",
    "type": "user"
  }
}
```

## Resource Group

+ Resource Group を作成

```
az group create --name ${Your resource group name} --location eastus
```

+ Resource Group の確認

```
az group list
```
