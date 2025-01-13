

### user as trainer , providing describing access 

- Create user in IAM
- Attach a policy to EKS cluster describe in specified region and specified cluster
- Create a role for user
    source: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
- Bind the role to user
    source: https://kubernetes.io/docs/reference/access-authn-authz/rbac/

- need to integrate IAM with EKS, for this we have to add aws-auth config
    ```
        kubectl get configmap aws-auth -n kube-system -o yaml
    ```
    source: https://docs.aws.amazon.com/eks/latest/userguide/auth-configmap.html

- Apply kubectl with file name *trainee.yaml*
    ```
        kubectl apply -f trainee.yaml
    ```

- Apply kubectl with file name *aws-auth.yaml*
    ```
        kubectl apply -f aws-auth.yaml
    ```
    Note: Warning will be, we can igonre
---
## Testing 
- create EC2
- Login into EC2
- AWS congfigure with secret and accesskey
- 
    ```
    us-east-1:258860052228:cluster/robokart-dev to /home/ec2-user/.kube/config

    ```

    we can see all update in
    ```
     cat .kube/config
    ```
    resource: https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html



Note:
Namespaces level
- role
- rolebinding

cluster level
- clusterrole
- clusterrolebinding