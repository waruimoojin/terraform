

resource "helm_release" "argocd" {
  name       = "argo-cd"  # Nom temporaire différent
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  version    = "5.51.6"

  values = [
    file("${path.module}/argocd-values.yaml")
  ]

  # Évite les conflits lors des redéploiements
  force_update = true
  recreate_pods = true
  

}

