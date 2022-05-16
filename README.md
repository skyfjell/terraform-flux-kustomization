<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.5.1, < 3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.3, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.5.1, < 3.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1.3, < 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_decryption"></a> [decryption](#input\_decryption) | Provider and secret for manifest decryption | <pre>object({<br>    provider = optional(string)<br>    secret   = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | Interval to check the repo for reconciliation | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the release | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace the release belongs to(not deployed to) | `string` | `"flux-system"` | no |
| <a name="input_path"></a> [path](#input\_path) | Path within the repository containing manifests | `string` | n/a | yes |
| <a name="input_prune"></a> [prune](#input\_prune) | Remove resources that are missing from the manifests | `bool` | `true` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository resource reference(GitRepository/HelmRepository) | <pre>object({<br>    name      = optional(string)<br>    namespace = optional(string)<br>    kind      = optional(string)<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_manifest"></a> [manifest](#output\_manifest) | n/a |
<!-- END_TF_DOCS -->
