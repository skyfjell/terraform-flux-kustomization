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
  source  = "skyfjell/install/flux"
  version = "1.0.4"
}

module "git_repository" {
  source  = "skyfjell/git-repository/flux"
  version = "1.0.3"

  name = "kustomization"
  url  = "https://github.com/skyfjell/examples.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux_install]
}

module "kustomization_git" {
  source = "../../"

  name = "kustomization"
  path = "manifests"

  # source_ref = {
  #   # If name differs from repository name:
  #   name = module.git_repository.name
  # }
}
