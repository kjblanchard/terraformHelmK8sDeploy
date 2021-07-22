resource "kubernetes_service" "name_generator_service" {
  metadata {
    name = "name-generator-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.name_generator_deployment.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}