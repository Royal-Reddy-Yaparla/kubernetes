

## conditions
- metric server , which measures pod resources dynamically.
- deployment should have resouse request and limt.



## To know resouces consume in pods
```
    kubectl top pods
```

to execute above result need to install metrics server
```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```
```
    kubectl top pods
```
```
    kubectl get pods -n robokart
```
source: 
https://github.com/kubernetes-sigs/metrics-server