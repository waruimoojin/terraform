resource "helm_release" "jenkins" {
  name       = var.release_name
  namespace  = var.namespace
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = var.chart_version

  set {
    name  = "controller.admin.username"
    value = var.admin_user
  }

  set {
    name  = "controller.admin.password"
    value = var.admin_password
  }

  set {
    name  = "controller.serviceType"
    value = "LoadBalancer"
  }

set {
  name  = "controller.resources.requests.memory"
  value = "512Mi"
}

set {
  name  = "controller.resources.requests.cpu"
  value = "200m"
}

set {
  name  = "controller.resources.limits.memory"
  value = "1Gi"
}

set {
  name  = "controller.resources.limits.cpu"
  value = "500m"
}
}