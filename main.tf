resource "helm_release" "this" {
  name       = local.name
  repository = "https://skyfjell.github.io/charts"
  chart      = "null"
  values     = [yamlencode({ manifests = [local.manifest] })]
}
