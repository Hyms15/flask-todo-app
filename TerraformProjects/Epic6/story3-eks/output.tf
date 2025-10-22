output "cluster_name" {
  value = aws_eks_cluster.shivani_cluster.name
}

output "cluster_arn" {
  value = aws_eks_cluster.shivani_cluster.arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.shivani_cluster.endpoint
}
