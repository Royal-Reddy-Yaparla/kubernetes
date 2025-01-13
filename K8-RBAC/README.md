

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