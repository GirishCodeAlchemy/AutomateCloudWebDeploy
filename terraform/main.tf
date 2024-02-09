
data "local_file" "templates" {
  for_each = toset([
    for file in fileset(path.module, "../CloudWebApp/*.yml") :
    file
  ])

  filename = replace("${path.module}/${each.key}", "templates", "rendered")
}

resource "kubernetes_manifest" "configmap" {
  manifest = yamldecode(templatefile(data.local_file.templates["../CloudWebApp/configmap.yml"].filename, {
    configmap_name = var.configmap_name
    dns_name       = var.dns_name
  }))
}

resource "kubernetes_manifest" "deployment" {
  manifest = yamldecode(templatefile(data.local_file.templates["../CloudWebApp/deployment.yml"].filename, {
    deployment_name = var.deployment_name
    configmap_name  = var.configmap_name
    dns_name        = var.dns_name
  }))
}

resource "kubernetes_manifest" "service1" {
  manifest = yamldecode(templatefile(data.local_file.templates["../CloudWebApp/svc.yml"].filename, {
    service_name = var.service_name
    dns_name     = var.dns_name
  }))
}

resource "kubernetes_manifest" "ingress" {
  manifest = yamldecode(templatefile(data.local_file.templates["../CloudWebApp/ingress.yml"].filename, {
    ingress_name = var.ingress_name
    service_name = var.service_name
    dns_name     = var.dns_name
  }))
}
