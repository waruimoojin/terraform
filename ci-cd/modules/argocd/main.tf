resource "helm_release" "argocd" {
  name       = var.release_name
  namespace  = var.namespace
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.48.0"
}
