resource "kubernetes_horizontal_pod_autoscaler" "deployment_hpa" {
  metadata {
    name      = "${var.deploymentName}-deployment-hpa"
  }

  spec {
    max_replicas = var.max_replicas
    min_replicas = var.min_replicas

    target_cpu_utilization_percentage = var.cpu_scale_threshold

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "${var.deploymentName}"
    }
  }
}