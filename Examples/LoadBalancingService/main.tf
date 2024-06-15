locals {
  appName = "testpod"
}

resource "kubernetes_deployment" "test_deployment" {
  metadata {
    name = "test-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = local.appName
      }
    }

    template {
      metadata {
        labels = {
          app = local.appName
        }
      }

      spec {
        container {
          name  = "test-node-app"
          image = "test-node"

          port {
            container_port = 3000
          }

          image_pull_policy = "Never"
        }
      }
    }
  }
}

resource "kubernetes_service" "test_node_service" {
  metadata {
    name = "test-node-service"
  }

  spec {
    selector = {
      app = local.appName
    }
    port {
      port = 3000
    }

    type = "LoadBalancer"
  }
}
