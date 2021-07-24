resource "helm_release" "metrics_server_release" {
  name       = "kjb-metrics"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"
  version    = "5.9.0"

  set {
    name  = "apiService.create"
    value = "true"
  }

  depends_on = [
    data.aws_eks_cluster.cluster,
  ]
}

provider "helm" {
  kubernetes {
    config_path = "kubeconfig_${local.cluster_name}"
  }
}