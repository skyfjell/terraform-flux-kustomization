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

module "flux-install" {
  source  = "OmniTeqSource/install/flux"
  version = "0.1.6"
}

module "git-repository" {
  source = "../../../terraform-flux-git-repository"
  # source  = "OmniTeqSource/git-repository/flux"
  # version = "0.1.4"

  name = "kustomization-git"
  url  = "https://github.com/OmniTeqSource/examples.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}

module "kustomization-git" {
  source = "../../"

  name = "kustomization-git"
  path = "manifests"
}
