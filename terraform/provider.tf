terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
  }
  required_version = ">= 1.0"
}

provider "kubernetes" {
  host                     = var.KUBE_HOST
  cluster_ca_certificate   = base64decode(var.KUBE_CLUSTER_CA_CERT_DATA)
  config_context_auth_info = var.KUBE_CTX_AUTH_INFO
  token                    = var.KUBE_TOKEN
}
