resource "helm_release" "metrics_server_release" {
  name       = "kjb-metrics"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"
  version    = "5.9.0"
  depends_on = [
    data.aws_eks_cluster.cluster,
  ]
}

provider "helm" {
  kubernetes {
    config_path = "kubeconfig_${local.cluster_name}"
  }
}