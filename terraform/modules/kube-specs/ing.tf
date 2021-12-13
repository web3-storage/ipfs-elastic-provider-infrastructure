resource "kubernetes_ingress_class_v1" "aws_ipfs_ingress_class" {
  metadata {
    name = "aws-ipfs-ingress-class"
  }

  spec {
    # controller = "example.com/ingress-controller"
    controller = helm_release.ingress.name
    # parameters { # TODO: O que são esses parametros manoo??? Aperantaly optional..
    #   kind      = "IngressParameters"
    #   name      = "external-lb"
    # }
  }
}


resource "kubernetes_ingress_v1" "aws_ipfs_ingress" {
  # wait_for_load_balancer = true
  metadata {
    name = kubernetes_ingress_class_v1.aws_ipfs_ingress_class.metadata[0].name
  }

  spec {
    ingress_class_name = "external-lb"
    rule {
      http {
        path {
          backend {
            service {
              name = local.service_name
              port {
                number = local.service_port
              }
            }
          }
          path = "/peer/*"
        }
      }
    }

    # tls { # Termination
    #   secret_name = "tls-secret"
    # }
  }
}