# Terraform Flux Kustomization Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, < 2.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.5.1, < 3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.4.1, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.5.1, < 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_decryption"></a> [decryption](#input\_decryption) | Provider and secret for manifest decryption | <pre>object({<br>    provider = optional(string, "sops")<br>    secret   = optional(string, "flux-sops-gpg")<br>  })</pre> | `{}` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | Interval to check the repo for reconciliation | `string` | `"5m0s"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the release | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace the release belongs to(not deployed to) | `string` | `"flux-system"` | no |
| <a name="input_path"></a> [path](#input\_path) | Path within the repository containing manifests | `string` | n/a | yes |
| <a name="input_prune"></a> [prune](#input\_prune) | Remove resources that are missing from the manifests | `bool` | `true` | no |
| <a name="input_source_ref"></a> [source\_ref](#input\_source\_ref) | Source reference object | <pre>object({<br>    name      = optional(string)<br>    namespace = optional(string, "flux-system")<br>    kind      = optional(string, "GitRepository")<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_manifest"></a> [manifest](#output\_manifest) | n/a |
| <a name="output_name"></a> [name](#output\_name) | Name of the object with suffix(if enabled) |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Namespace the object was applied to |
<!-- END_TF_DOCS -->
