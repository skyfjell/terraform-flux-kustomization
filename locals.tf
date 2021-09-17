locals {
  name      = var.name
  namespace = var.namespace
  path      = var.path
  prune     = var.prune
}

locals {
  repository = defaults(
    var.repository,
    {
      name      = local.name
      namespace = local.namespace
      kind      = "GitRepository"
    }
  )
}

locals {
  interval = var.interval == null ? local.repository.kind == "HelmRepository" ? "30m0s" : "5m0s" : var.interval
}

locals {
  manifest = {
    apiVersion = "kustomize.toolkit.fluxcd.io/v1beta1"
    kind       = "Kustomization"
    metadata = {
      name       = local.name
      namespace  = local.namespace
      finalizers = ["finalizers.fluxcd.io"]
    }
    spec = {
      prune     = local.prune
      interval  = local.interval
      path      = local.path
      sourceRef = local.repository
      # TODO: Health Checks
    }
  }
}
