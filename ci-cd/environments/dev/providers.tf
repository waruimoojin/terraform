provider "kubernetes" {
  config_path = "/home/chakib/k3s-config.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "/home/chakib/k3s-config.yaml"
  }
}
