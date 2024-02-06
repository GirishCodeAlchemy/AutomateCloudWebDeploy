variable "KUBE_HOST" {
  type        = string
  description = "Specifies the URL of the Kubernetes API server."
}

variable "KUBE_CLUSTER_CA_CERT_DATA" {
  type        = string
  description = "The CA certificate used to verify the authenticity of the Kubernetes cluster"
}

variable "KUBE_CTX_AUTH_INFO" {
  type        = string
  description = "Describes the authentication context."
}

variable "KUBE_TOKEN" {
  type        = string
  description = "Represents the authentication token"
}
