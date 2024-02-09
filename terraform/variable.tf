variable "KUBE_CONFIG_CONTENT" {
  type        = string
  description = "Represents the content of kubeconfig"
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
