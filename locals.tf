locals {
  name      = var.random_suffix ? join("-", [var.name, random_string.this.id]) : var.name
  namespace = var.namespace
  path      = var.path
  prune     = var.prune

  source_ref = var.source_ref

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
      prune    = local.prune
      interval = local.interval
      path     = local.path
      # merge() to strip OptionalAttributes things for k8s provider
      sourceRef  = merge({}, local.source_ref)
      decryption = local.decryption
      # TODO: Health Checks
    }
  }
}
