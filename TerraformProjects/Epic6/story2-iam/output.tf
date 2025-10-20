output "eks_cluster_role_arn" {
  description = "ARN of the IAM role for the EKS Cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  description = "ARN of the IAM role for the EKS Node Group"
  value       = aws_iam_role.eks_node_role.arn
}
