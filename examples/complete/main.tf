provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"

  experiments {
    manifest_resource = true
  }
}

module "flux-install" {
  count   = 1
  source  = "L2Solutions/install/flux"
  version = ">= 0.1.0"
}

# Set to true after flux-install. GitRepository CRD need to be created before the repo instances may be created.
locals {
  install_complete = true
}

module "git-repository" {
  count = local.install_complete ? 1 : 0

  source  = "L2Solutions/git-repository/flux"
  version = "0.1.0"

  name = "kustomization-git"
  url  = "https://github.com/L2Solutions/examples.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}

module "kustomization-git" {
  count = local.install_complete ? 1 : 0

  source = "../../"

  name = "kustomization-git"
  path = "manifests"
}
