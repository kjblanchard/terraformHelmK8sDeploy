resource "kubernetes_service" "name_generator_service" {
  metadata {
    name = "name-generator-service"
  }
  spec {
    selector = {
      app = "name-generator"
    }
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}