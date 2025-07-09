resource "helm_release" "argocd" {
  name             = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  # version supprimée pour utiliser la dernière version
  values = [file("${path.module}/argocd-values.yaml")]
}