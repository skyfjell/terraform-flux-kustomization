provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "k3d-tftest"
  }
}

module "flux_install" {
  source  = "OmniTeqSource/install/flux"
  version = "0.2.0"
}

module "git_repository" {
  source  = "OmniTeqSource/git-repository/flux"
  version = "0.2.2"

  name = "kustomization"
  url  = "https://github.com/OmniTeqSource/examples.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux_install]
}

module "kustomization_git" {
  source = "../../"

  name = "kustomization"
  path = "manifests"

  source_ref = {
    name = module.git_repository.name
  }
}
