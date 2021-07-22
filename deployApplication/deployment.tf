resource "kubernetes_deployment" "name_generator_deployment" {
  metadata {
    name = "name-generator-deployment"
    labels = {
      name = "name-generator-deployment"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "name-generator"
      }
    }

    template {
      metadata {
        labels = {
          app = "name-generator"
        }
      }

      spec {
        container {
          image = var.image_id
          name  = "name-generator"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}