output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "kubectl_config" {
  description = "kubectl config as generated by the module."
  value       = module.eks.kubeconfig
}

output "config_map_aws_auth" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value       = module.eks.config_map_aws_auth
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}
output "bucket_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "lock_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "deployment_bucket"{
  description = "Where the deployment state will end up at"
  value = aws_s3_bucket.terraform_state
}
output "deployment_locks"{
  description = "Where the deployment lock will end up at"
  value = aws_dynamodb_table.terraform_locks
}