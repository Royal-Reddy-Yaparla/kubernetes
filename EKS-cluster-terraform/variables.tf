variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "common_tags" {
  default = {
    project_name = "robokart-eks"
    environment = "dev"
    terraform = true
  }
}

variable "vpc_tags" {
  default = {}
}
variable "igt_tags" {
  default = {}
}
variable "project_name" {
  default = "robokart-eks"
}
variable "environment" {
  default = "dev"
}

variable "cidr_public" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "cidr_private" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "is_peering_required" {
  default = true
}

variable "accepters_vpc_id" {
  default = ""
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "robokart"
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.30"
}

variable "node_groups" {
  description = "EKS node group configuration"
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
  default = {
    general = {
      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
      scaling_config = {
        desired_size = 2
        max_size     = 4
        min_size     = 2
      }
    }
  }
}