resource "helm_release" "jenkins" {
  name             = "jenkins"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "jenkins"
  namespace        = "cicd"
  create_namespace = true
  version          = "12.6.7"   # <--- ajouter une version valide

  values = [file("${path.module}/jenkins-values.yaml")]
}
