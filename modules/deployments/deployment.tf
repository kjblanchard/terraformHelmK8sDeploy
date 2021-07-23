resource "kubernetes_deployment" "name_generator_deployment" {
  metadata {
    name = "${var.deploymentName}-deployment"
    labels = {
      name = "${var.deploymentName}-deployment"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "${var.deploymentName}"
      }
    }

    template {
      metadata {
        labels = {
          app = "${var.deploymentName}"
        }
      }

      spec {
        container {
          image = var.image_id
          name  = "${var.deploymentName}"

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