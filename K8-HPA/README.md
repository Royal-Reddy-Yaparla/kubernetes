
### HPA

Horizontal Pod Autoscaler is a type of autoscaler that can increase or decrease the number of pods in a Deployment, ReplicationController, StatefulSet, or ReplicaSet, usually in response to CPU utilization patterns. This process represents horizontal scaling because it changes the number of instances, not the resources allocated to a given container.


Resources:
https://foxutech.medium.com/horizontal-pod-autoscaler-hpa-know-everything-about-it-5637c7d2438a

## conditions
- metric server , which measures pod resources dynamically.
- deployment should have resouse request and limt.

## To know resouces consume in pods
```
    kubectl top pods
```

to execute above result need to install *metrics* server
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

## Increase the load 
```
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://a301c7f202e9947688b00b55601e6f6e-1885861375.us-east-1.elb.amazonaws.com ; done"

```