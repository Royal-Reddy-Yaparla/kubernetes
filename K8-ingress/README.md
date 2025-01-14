resource: https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/deploy/installation/

- Create an IAM OIDC provider. You can skip this step if you already have one for your cluster.
```
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster robokart-dev \
    --approve

```
- If our cluster is in any other region
```
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json

```

- Create an IAM policy named AWSLoadBalancerControllerIAMPolicy. If you downloaded a different policy, replace iam-policy with the name of the policy that you downloaded.

```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json
```

Create an IAM role and Kubernetes ServiceAccount for the LBC. Use the ARN from the previous step.
```
eksctl create iamserviceaccount \
--cluster=robokart-dev \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::258860052228:policy/AWSLoadBalancerControllerIAMPolicy \
--override-existing-serviceaccounts \
--region us-east-1 \
--approve

```

- Add the EKS chart repo to Helm

```
helm repo add eks https://aws.github.io/eks-charts
```

- Helm install command for clusters with IRSA:

```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=robokart-dev --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller

```

- we check 
```
kubectl get pods -n kube-system
```

- we need to provide annotation
sources: https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/examples/echo_server/

```
alb.ingress.kubernetes.io/scheme: internet-facing
alb.ingress.kubernetes.io/target-type: ip
alb.ingress.kubernetes.io/tags: Environment=dev,Team=test,Project=Roboshop

```

```
alb.ingress.kubernetes.io/group.name: robokart
```
Note: here we are grouping same servers to avoid seperate load balancer to each