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
    provider = optional(string)
    secret   = optional(string)
  })
}

variable "random_suffix" {
  description = "Add a random alpha-numeric suffix to resource names(prevents helm release collision)"
  default     = true
  type        = bool
}

variable "source_ref" {
  description = "Source reference object"
  type = object({
    name      = string
    namespace = optional(string)
    kind      = optional(string)
  })
}
