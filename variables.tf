variable "name" {
  description = "Name of the release"
  type        = string
}

variable "namespace" {
  description = "Namespace the release belongs to(not deployed to)"
  default     = "flux-system"
  type        = string
}


variable "interval" {
  description = "Interval to check the repo for reconciliation"
  default     = "5m0s"
  type        = string
}

variable "path" {
  description = "Path within the repository containing manifests"
  type        = string
}

variable "prune" {
  description = "Remove resources that are missing from the manifests"
  default     = true
  type        = bool
}

variable "decryption" {
  description = "Provider and secret for manifest decryption"
  default     = {}
  type = object({
    provider = optional(string, "sops")
    secret   = optional(string, "flux-sops-gpg")
  })
}

variable "source_ref" {
  description = "Source reference object"
  type = object({
    name      = optional(string)
    namespace = optional(string, "flux-system")
    kind      = optional(string, "GitRepository")
  })
  default = {}
}
