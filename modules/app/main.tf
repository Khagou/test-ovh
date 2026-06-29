# Secret Kubernetes pour puller l'image depuis le registry OVH privé
resource "kubernetes_secret" "registry_creds" {
  metadata {
    name = "${var.app_name}-registry-creds"
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        (var.registry_url) = {
          username = var.registry_username
          password = var.registry_password
          auth     = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = var.app_name
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret.registry_creds.metadata[0].name
        }

        container {
          name              = var.app_name
          image             = var.image
          image_pull_policy = "Always"

          port {
            container_port = var.port
          }

          resources {
            requests = {
              cpu    = "50m"
              memory = "64Mi"
            }
            limits = {
              cpu    = "200m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = var.app_name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = 80
      target_port = var.port
    }

    type = "LoadBalancer"
  }
}
