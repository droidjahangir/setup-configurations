## Common Commands

## Node

* Get connected nodes `k get nodes`

## Pod
* Get pods `k get pod`
* Get pod in specific namespace `k get pods -n kube-system`
* Get pods in all namespaces `k get pods --all-namespaces`


## Services

* Get services `k get svc`
* Get all services `k get services --all-namespaces`


## Create API server
```shell
kubectl proxy
```

Get rest api response from kubernetes
```shell
curl localhost:8001/apis
```


