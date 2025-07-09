resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "57.0.2"

  namespace = var.namespace
  create_namespace = true

  values = [
    yamlencode({
      grafana = {
        adminPassword = var.grafana_admin_password
        service = {
            type     = "NodePort"
            nodePort = 32000
        }
      }
    })
  ]
}
