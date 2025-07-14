resource "kubernetes_namespace" "cicd" {
  metadata {
    name = "cicd"
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

module "jenkins" {
  source         = "../../modules/jenkins"
  namespace      = kubernetes_namespace.cicd.metadata[0].name
  release_name   = "jenkins"
  chart_version  = "5.7.1"
  admin_user     = "admin"
  admin_password = "admin"
}


module "sonarqube" {
  source             = "../../modules/sonarqube"
  namespace          = kubernetes_namespace.cicd.metadata[0].name
  release_name       = "sonarqube"
  chart_version      = "8.1.11"
  admin_password     = "adminsonar"
  postgres_password  = "sonarpass"
}



module "argocd" {
  source         = "../../modules/argocd"
  namespace      = kubernetes_namespace.argocd.metadata[0].name
  release_name   = "argocd"
  chart_version  = "5.51.5"
}
