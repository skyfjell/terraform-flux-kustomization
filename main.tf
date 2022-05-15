resource "helm_release" "this" {
  name       = local.name
  repository = "https://omniteqsource.github.io/charts"
  chart      = "null"
  values     = [yamlencode({ manifests = [local.manifest] })]
}
