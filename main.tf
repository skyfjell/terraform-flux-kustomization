resource "random_string" "this" {
  keepers = {
    name = local.name
  }

  upper   = false
  special = false
  length  = 8
}

resource "helm_release" "this" {
  name       = join("-", [local.name, random_string.this.id])
  repository = "https://omniteqsource.github.io/charts"
  chart      = "null"
  values     = [yamlencode({ manifests = [local.manifest] })]
}
