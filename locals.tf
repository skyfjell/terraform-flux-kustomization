locals {
  name      = var.name
  namespace = var.namespace
  path      = var.path
  prune     = var.prune

  source_ref = merge(
    var.source_ref,
    { name = join("-", [lower(replace(var.source_ref.kind, "/(.)([A-Z]+)/", "$1-$2")), var.name]) },
  )

  interval = var.interval

  decryptionTmp = var.decryption

  decryption = {
    provider = local.decryptionTmp.provider
    secretRef = {
      name = local.decryptionTmp.secret
    }
  }

  manifest = {
    apiVersion = "kustomize.toolkit.fluxcd.io/v1beta2"
    kind       = "Kustomization"
    metadata = {
      name       = local.name
      namespace  = local.namespace
      finalizers = ["finalizers.fluxcd.io"]
    }
    spec = {
      prune      = local.prune
      interval   = local.interval
      path       = local.path
      sourceRef  = local.source_ref
      decryption = local.decryption
      # TODO: Health Checks
    }
  }
}
