resource "helm_release" "sonarqube" {
  name       = var.release_name
  namespace  = var.namespace

  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "sonarqube"
  version    = var.chart_version

  set {
    name  = "auth.adminPassword"
    value = var.admin_password
  }

  set {
    name  = "monitoringPasscode"
    value = "changeme"
  }

  set {
    name  = "community.enabled"
    value = "true"
  }

  # Active la base interne PostgreSQL
  set {
    name  = "postgresql.enabled"
    value = "true"
  }

  set {
    name  = "postgresql.postgresqlPassword"
    value = var.postgres_password
  }

  set {
    name  = "postgresql.postgresqlDatabase"
    value = "sonarqube"
  }

  set {
    name  = "postgresql.postgresqlUsername"
    value = "sonaruser"
  }

  # LoadBalancer pour avoir une IP externe
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "postgresql.image.tag"
    value = "16.6.0-debian-12-r0"
}

}
