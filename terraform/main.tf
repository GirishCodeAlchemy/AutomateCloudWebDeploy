resource "kubernetes_manifest" "configmap" {
  manifest = yamldecode(file("../CloudWebApp/configmap.yml"))
}

resource "kubernetes_manifest" "deployment" {
  manifest = yamldecode(file("../CloudWebApp/deployment.yml"))

}

resource "kubernetes_manifest" "service1" {
  manifest = yamldecode(file("../CloudWebApp/svc.yml"))
}

resource "kubernetes_manifest" "ingress" {
  manifest = yamldecode(file("../CloudWebApp/ingress.yml"))
}
