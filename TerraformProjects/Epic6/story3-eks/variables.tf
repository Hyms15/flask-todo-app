variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "cluster_name" {
  default = "shivani-eks-cluster"
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}

variable "cluster_role_arn" {}
variable "node_role_arn" {}
