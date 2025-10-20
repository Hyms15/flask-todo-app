# variables.tf

variable "name" {
  description = "Base name to use for resource naming"
  type        = string
  default     = "demo"
}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Project    = "EKS-Epic6"
    Owner      = "Shivani"
    Environment = "dev"
    CostCenter = "k8s"
  }
}
