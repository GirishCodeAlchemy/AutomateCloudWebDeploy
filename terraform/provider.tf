terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
  }
  required_version = ">= 1.0"
}

locals {
  kubeconfig_decoded = yamldecode(var.KUBE_CONFIG_CONTENT)
}

provider "kubernetes" {
  host                   = local.kubeconfig_decoded.clusters[0].cluster.server
  cluster_ca_certificate = base64decode(local.kubeconfig_decoded.clusters[0].cluster["certificate-authority-data"])
  token                  = local.kubeconfig_decoded.users[0].user.token
}
