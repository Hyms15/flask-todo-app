# AWS Region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# Default tags applied to all resources
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "Epic6"
    Environment = "Dev"
    Owner       = "Shivani"
  }
}

# IAM role names
variable "eks_cluster_role_name" {
  description = "Name for the EKS Cluster IAM Role"
  type        = string
  default     = "eks-cluster-role"
}

variable "eks_node_role_name" {
  description = "Name for the EKS Worker Node IAM Role"
  type        = string
  default     = "eks-nodegroup-role"
}
