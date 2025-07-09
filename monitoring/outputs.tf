output "grafana_service_info" {
  value = helm_release.kube_prometheus_stack.status
}
