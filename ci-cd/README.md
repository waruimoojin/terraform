

# README - Déploiement CI/CD avec Terraform, Helm & Kubernetes

Ce dépôt permet de déployer Jenkins, SonarQube et ArgoCD sur Kubernetes avec Terraform.

---

## Structure du projet

```
environments/
└── dev/
    ├── main.tf
    ├── providers.tf
    ├── variables.tf
    ├── terraform.tfvars
    ├── versions.tf
    ├── terraform.tfstate*
modules/
├── argocd/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── jenkins/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
└── sonarqube/
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
```

---

## Prérequis

* Kubernetes cluster opérationnel avec accès `kubectl`
* Terraform installé (version compatible avec `versions.tf`)
* Helm installé localement si besoin
* Accès réseau (LoadBalancer, NodePort) selon ta config

---

## Variables importantes à renseigner dans `terraform.tfvars` (exemple)

```hcl
namespace         = "cicd"
release_name      = "sonarqube"
chart_version     = "8.1.11"
admin_password    = "ChangeMoi123!"
postgres_password = "ChangeMoi123!"
```

---

## Étapes pour déployer

1. Initialiser Terraform (depuis `environments/dev/`):

```bash
terraform init
```

2. Vérifier le plan d’exécution :

```bash
terraform plan -var-file=terraform.tfvars
```

3. Appliquer la configuration :

```bash
terraform apply -var-file=terraform.tfvars
```

4. Vérifier que les pods sont bien lancés :

```bash
kubectl get pods -n cicd
kubectl get pods -n argocd
```

5. Récupérer les IP et ports des services exposés :

```bash
kubectl get svc -n cicd
kubectl get svc -n argocd
```

---

## Commandes utiles

* Afficher logs d’un pod :

```bash
kubectl logs -n <namespace> <pod-name>
```

* Supprimer un PVC bloqué (exemple avec un PVC SonarQube) :

```bash
kubectl patch pvc <pvc-name> -n <namespace> -p '{"metadata":{"finalizers":null}}' --type=merge
kubectl delete pvc <pvc-name> -n <namespace>
```

* Forcer suppression d’un pod :

```bash
kubectl delete pod <pod-name> -n <namespace> --force --grace-period=0
```

---

## Notes

* Jenkins et SonarQube sont déployés dans le namespace `cicd`
* ArgoCD est déployé dans le namespace `argocd`
* SonarQube utilise une base PostgreSQL intégrée via Helm chart Bitnami
* En cas de problème avec la base, supprimer le PVC lié permet une réinitialisation
* Stocker en sécurité les mots de passe dans un gestionnaire adapté (ex : Vault, GitLab CI variables, etc.)
* Adapter les versions dans `versions.tf` et `terraform.tfvars` selon les besoins

---

## Prochaines étapes possibles

* Mise en place d’un pipeline Jenkins pour build, tests, analyse SonarQube
* Automatisation GitOps via ArgoCD
* Gestion des Ingress avec certificats TLS

---

Veux-tu aussi un exemple de pipeline Jenkins à intégrer dans ce contexte ?

---

Voilà un README clair, précis et adapté à ta structure de fichiers.
Tu veux que je te génère ça en markdown prêt à copier-coller ?
