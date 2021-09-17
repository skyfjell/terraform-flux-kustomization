resource "kubernetes_manifest" "this" {
  manifest = local.manifest
}
