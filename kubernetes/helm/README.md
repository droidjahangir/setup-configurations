# Helm Installation guid and integrate to kubernetes

official documentation guide : https://helm.sh/docs/intro/quickstart/

Helm repository list : https://artifacthub.io/packages/search?kind=0

### Step - 01
Install helm into server

```shell
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### Step - 02
Initialize a Helm Chart Repository

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
```

check list `helm search repo bitnami`

### Step - 03
update repo
```shell
helm repo update
```

* Get available command `helm get -h`
* Install a package `helm install bitnami/mysql --generate-name`
* Check status `helm status mysql-1612624192`
* List packages `helm list`
* Uninstall a package `helm uninstall mysql-1612624192`
