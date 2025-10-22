# ------------------------------
# EKS Cluster creation
# ------------------------------

resource "aws_eks_cluster" "shivani_cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # optional logging (good practice)
  enabled_cluster_log_types = ["api", "audit", "authenticator"]

  tags = {
    Project     = "Epic6"
    Environment = "Dev"
    Owner       = "Shivani"
  }
}
