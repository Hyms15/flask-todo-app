output "kubeconfig_file" {
  value       = local_file.kubeconfig.filename
  description = "Path to the automatically generated kubeconfig file"
}
