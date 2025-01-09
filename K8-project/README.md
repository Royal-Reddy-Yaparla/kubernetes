### Robokart Deployment with Kubernetes

**EKS Cluster Configuration**
<img src="./images/eksctl.png" alt="Getting started" />

**Communication between components**
<img src="./images/Architecture-flow.png" alt="Getting started" />


#### **Overview**
This project demonstrates the deployment of a complete e-commerce system called Robokart using Kubernetes. The system includes various frontend, backend, and database components, with a focus on scalability, maintainability, and security.

---

### **Project Components**
#### 1. **Frontend**
- **Web**

#### 2. **Backend**
- **Catalogue**
- **Cart**
- **User**
- **Shipping**
- **Payment**

#### 3. **Database**
- **MongoDB**
- **MySQL**
- **Redis**
- **RabbitMQ**

---

### **Implementation Details**

#### **Namespace**
- Created a dedicated namespace named `robokart` to isolate project resources.

#### **Deployment and ReplicaSets**
- Deployed all components using Kubernetes **Deployment** and **ReplicaSet** resources for high availability and reliability.

#### **Configuration Management**
- Used **ConfigMap** and **Secrets** for managing configurations, environment variables, and database credentials.
- Encrypted database credentials using **base64** for secure storage.

#### **Services**
- **LoadBalancer Service**: Configured for the frontend `web` component to expose it to external traffic.
- **ClusterIP Service**: Used for internal communication between backend and database components.

#### **Labels**
- Maintained proper **labels** for each component to organize and manage resources effectively.

#### **Container Images**
- Pulled container images for all components from **Docker Hub**.

#### **Namespace Configuration**
- Configured `kubens` to set the default namespace as `robokart` for efficient operations.

#### **Image Updates**
- Implemented **ImagePullPolicy** to ensure smooth updates for components when new images are available.

#### **Volume Mounts**
- Mounted an **Nginx configuration file** as a volume for the `web` component to customize the server configuration.

#### **Manifest Files**
- Created a separate **repository** for each component and defined Kubernetes **manifest files** in YAML format.
- Deployed resources using the command:
  ```bash
  kubectl apply -f <manifest.yaml>
  ```

---

### **How to Deploy**
1. **Clone the Repositories**
   Clone each component's repository and navigate to the directory containing the manifest files.

2. **Create the Namespace and make as default namespace**
    ```bash
    kubectl apply -f namespace.yaml
    kubens robokart
    ```
    Configured `kubens` to set the default namespace as `robokart` for efficient operations.

3. **Switch to the Namespace**
   Set the `robokart` namespace as the default:
   ```bash
   kubens robokart
   ```

4. **Apply the Manifest Files**
   Deploy each component using:
   ```bash
   kubectl apply -f <manifest.yaml>
   ```

5. **Verify Deployment**
   Check the status of all resources:
   ```bash
   kubectl get all -n robokart
   ```

---

### **Future Enhancements**
- Implement Horizontal Pod Autoscaling (HPA) for dynamic scaling based on traffic.
- Add monitoring and logging using Prometheus and Grafana.
- Introduce CI/CD pipelines for automated deployments.
- Configure ingress for a unified entry point for all components.



