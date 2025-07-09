variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "/home/chakib/k3s-config.yaml"
}

variable "namespace" {
  description = "Namespace for monitoring stack"
  type        = string
  default     = "monitoring"
}

variable "grafana_admin_password" {
  description = "Admin password for Graafana"
  type        = string
  default     = "admin"  
}

variable "grafana_service_type" {
  description = "Kubernetes service type for Grafana"
  type        = string
  default     = "LoadBalancer"
}



