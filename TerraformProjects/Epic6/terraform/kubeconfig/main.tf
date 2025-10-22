terraform {
  required_providers {
    aws = { source = "hashicorp/aws",  version = "~> 5.0" }
    local = { source = "hashicorp/local", version = "~> 2.0" }
  }
}

# Inherit AWS provider from root, or uncomment to pin a region:
# provider "aws" { region = var.region }

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

# Pull live cluster info (so the kubeconfig always matches reality)
data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

# Write kubeconfig file next to this module
resource "local_file" "kubeconfig" {
  filename = "${path.module}/kubeconfig"

  content = <<EOT
apiVersion: v1
clusters:
- cluster:
    server: ${data.aws_eks_cluster.this.endpoint}
    certificate-authority-data: ${data.aws_eks_cluster.this.certificate_authority[0].data}
  name: ${data.aws_eks_cluster.this.name}
contexts:
- context:
    cluster: ${data.aws_eks_cluster.this.name}
    user: aws
  name: ${data.aws_eks_cluster.this.name}
current-context: ${data.aws_eks_cluster.this.name}
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws
      args:
        - eks
        - get-token
        - --cluster-name
        - ${data.aws_eks_cluster.this.name}
EOT
}
