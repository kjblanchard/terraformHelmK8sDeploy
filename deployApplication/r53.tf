resource "aws_route53_record" "k8s" {
  zone_id = "Z1033734GXUIGI0YW2PJ"
  name    = "kubernetes.supergoon.com"
  type    = "A"
  allow_overwrite = true
  alias {
    name                     = kubernetes_service.name_generator_service.status.0.load_balancer.0.ingress.0.hostname
    zone_id                  = "Z3AADJGX6KTTL2"  
    evaluate_target_health   = true
  }
}