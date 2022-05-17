locals {
  name      = var.random_suffix ? join("-", [var.name, random_string.this.id]) : var.name
  namespace = var.namespace
  path      = var.path
  prune     = var.prune
}

locals {
  source_ref = defaults(
    var.source_ref,
    {
      namespace = local.namespace
      kind      = "GitRepository"
    }
  )
}

locals {
  interval = var.interval
}

locals {
  decryptionTmp = defaults(
    var.decryption,
    {
      provider = "sops"
      # checkov:skip=CKV_SECRET_6:Not a git secret.
      secret = "flux-sops-gpg"
    }
  )
}

locals {
  decryption = {
    provider = local.decryptionTmp.provider
    secretRef = {
      name = local.decryptionTmp.secret
    }
  }
}

locals {
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
