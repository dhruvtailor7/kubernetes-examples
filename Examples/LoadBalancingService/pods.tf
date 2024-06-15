# resource "kubernetes_pod" "testpod" {
#   metadata {
#     name = "testpod"
#   }
#   spec {
#     container {
#       image = "test-node"
#       name  = "test-node-app"

#       port {
#         container_port = 3000
#       }

#       image_pull_policy = "Never"
#     }

#   }
# }