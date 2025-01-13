### RBAC in Kubernetes

Role-Based Access Control (RBAC) in Kubernetes is a method for regulating access to resources within your cluster. By defining roles with specific permissions and assigning those roles to users, RBAC ensures that users have access only to the resources they need, adhering to the principle of least privilege.

*resource*:

https://medium.com/@subhampradhan966/configuring-kubernetes-rbac-a-comprehensive-guide-b6d40ac7b257
https://medium.com/@muppedaanvesh/a-hand-on-guide-to-kubernetes-rbac-with-a-user-creation-%EF%B8%8F-1ad9aa3cafb1

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
    aws eks update-kubeconfig --region region-code --name my-cluster
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