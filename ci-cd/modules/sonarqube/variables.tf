variable "namespace" {}
variable "release_name" {}
variable "chart_version" {}
variable "admin_password" {
  type        = string
  description = "Mot de passe admin SonarQube"
}

variable "postgres_password" {
  type        = string
  description = "Mot de passe PostgreSQL"
}
