variable "KUBE_HOST" {
  type        = string
  description = "Specifies the URL of the Kubernetes API server."
}

variable "KUBE_CLUSTER_CA_CERT_DATA" {
  type        = string
  description = "The CA certificate used to verify the authenticity of the Kubernetes cluster"
}

variable "KUBE_TOKEN" {
  type        = string
  description = "Represents the authentication token"
}

variable "configmap_name" {
  description = "Name of the ConfigMap resource"
  type        = string
  default     = "girishcodealchemy-configmap"
}

variable "deployment_name" {
  description = "Name of the Deployment resource"
  type        = string
  default     = "girishcodealchemy"
}

variable "service_name" {
  description = "Name of the Service resource"
  type        = string
  default     = "girishcodealchemy-svc"
}

variable "ingress_name" {
  description = "Name of the Ingress resource"
  type        = string
  default     = "girishcodealchemy-ingress"
}

variable "dns_name" {
  description = "Name of the DNS"
  type        = string
  default     = "girishcodealchemy.test-subaccount-1-v02.test-subaccount-1.rr.mu"
}
