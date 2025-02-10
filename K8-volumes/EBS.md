---

# **EBS Persistent Volumes in Kubernetes**  

## **EBS Basics**  
**Amazon EBS (Elastic Block Store)** provides block storage for EC2 instances. It is used in Kubernetes to provide **persistent storage** for applications.  

---

## **Static Provisioning**  
1. **Manual Volume Creation**  
   - First, create an **EBS volume** manually from the AWS console or CLI.  
   - When deleting resources (Pods, PVCs), the EBS **volume will not be deleted automatically** unless explicitly configured.  

2. **Attach Volume to Kubernetes**  
   - The **AWS EBS CSI Driver** (Container Storage Interface) must be installed to allow Kubernetes to use EBS.  
   - The volume should be in the **same Availability Zone (AZ) as the node** where the pod is running.  

3. **IAM Role Requirement**  
   - The EC2 instances (worker nodes) must have the **proper IAM roles** attached to allow them to interact with EBS.  
   - Minimum permissions required:  
     - `ec2:CreateVolume`  
     - `ec2:AttachVolume`  
     - `ec2:DetachVolume`  
     - `ec2:DeleteVolume`  
     - `ec2:DescribeVolumes`  

---

## **Kubernetes Storage Objects**  
1. **Persistent Volume (PV)**  
   - Represents an **external storage resource** in Kubernetes (e.g., an EBS volume).  
   - Avoids direct interaction with storage resources by defining them as **Kubernetes objects**.  
   - Created **manually (static provisioning)** or **dynamically** using a StorageClass.  

2. **Persistent Volume Claim (PVC)**  
   - A **request for storage** by a Pod.  
   - The PVC will be **bound to an available PV** that meets the requested storage size and access mode.  
   - If a matching PV does not exist, **dynamic provisioning** (if enabled) will create a new volume.  

3. **Node Selector for EBS Volumes**  
   - EBS volumes are **zone-specific** (tied to an Availability Zone).  
   - To ensure that a Pod runs on a node with the correct volume, use **node selectors**:  
     ```sh
     kubectl label nodes <node-name> zone=us-east-1b
     ```
   - The Pod can then specify:  
     ```yaml
     nodeSelector:
       zone: us-east-1b
     ```

---

## **Dynamic Provisioning**  
1. **Automatic Volume Creation**  
   - Instead of manually creating an EBS volume, Kubernetes can **dynamically create** storage when requested.  
   - This is done using **StorageClass (SC)** objects.  

2. **StorageClass (SC) Overview**  
   - Defines how **new PVs** should be created dynamically.  
   - Manages **volume creation, deletion, and lifecycle** automatically.  
   - Each **SC is cluster-wide** (not namespaced).  

3. **How It Works**  
   - When a **PVC requests storage**, if no existing PV matches:  
     - Kubernetes will use the associated **StorageClass** to create a new PV.  
     - An **EBS volume will be automatically provisioned** in AWS.  
   - When the PVC is deleted, the **SC handles volume deletion** (depending on the reclaim policy).  

4. **Reclaim Policy of StorageClass**  
   - **Retain**: The volume remains after PVC deletion (manual cleanup needed).  
   - **Delete**: The volume is automatically deleted when PVC is deleted.  
   - **Recycle**: (Deprecated) Volume is scrubbed and reused.  

5. **Creating a Custom StorageClass**  
   ```yaml
   apiVersion: storage.k8s.io/v1
   kind: StorageClass
   metadata:
     name: ebs-sc
   provisioner: ebs.csi.aws.com
   parameters:
     type: gp3
     fsType: ext4
   reclaimPolicy: Delete
   volumeBindingMode: WaitForFirstConsumer
   ```
   - `provisioner`: Uses the AWS EBS CSI driver.  
   - `parameters`: Specifies EBS volume type (`gp2`, `gp3`, `io1`, etc.).  
   - `reclaimPolicy`: Controls what happens when PVC is deleted.  
   - `volumeBindingMode`:  
     - `Immediate` → Volume is provisioned as soon as PVC is created.  
     - `WaitForFirstConsumer` → Volume is provisioned **only when a Pod requests it** (recommended).  

---

## **Final Thoughts**
- **Static provisioning** → Manually create volumes and attach them to PVs.  
- **Dynamic provisioning** → Use **StorageClass** to create and manage storage automatically.  
- **IAM roles & CSI drivers** are required to manage EBS volumes in Kubernetes.  
- **Persistent Volumes (PV)** and **Persistent Volume Claims (PVC)** abstract storage management for Kubernetes applications.  
