# outputs.tf

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "IDs of the public subnets"
  value       = [for s in aws_subnet.public : s.id]
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value       = [for s in aws_subnet.private : s.id]
}

output "availability_zones" {
  description = "List of availability zones used"
  value       = local.azs
}
