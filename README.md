# Terraform Flux Kustomization Module

## This Module Has Moved To:

<https://registry.terraform.io/modules/etesiai/kustomization/flux/latest>

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                        | Version           |
| --------------------------------------------------------------------------- | ----------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0, < 2.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement_helm)                   | >= 2.5.1, < 3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="requirement_random"></a> [random](#requirement_random)             | >= 3.1.3, < 4.0.0 |

## Providers

| Name                                                      | Version           |
| --------------------------------------------------------- | ----------------- |
| <a name="provider_helm"></a> [helm](#provider_helm)       | >= 2.5.1, < 3.0.0 |
| <a name="provider_random"></a> [random](#provider_random) | >= 3.1.3, < 4.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                        | Type     |
| ----------------------------------------------------------------------------------------------------------- | -------- |
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)   | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name                                                                     | Description                                                                          | Type                                                                                                      | Default         | Required |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- | --------------- | :------: |
| <a name="input_decryption"></a> [decryption](#input_decryption)          | Provider and secret for manifest decryption                                          | <pre>object({<br> provider = optional(string)<br> secret = optional(string)<br> })</pre>                  | `{}`            |    no    |
| <a name="input_interval"></a> [interval](#input_interval)                | Interval to check the repo for reconciliation                                        | `string`                                                                                                  | `"5m0s"`        |    no    |
| <a name="input_name"></a> [name](#input_name)                            | Name of the release                                                                  | `string`                                                                                                  | n/a             |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)             | Namespace the release belongs to(not deployed to)                                    | `string`                                                                                                  | `"flux-system"` |    no    |
| <a name="input_path"></a> [path](#input_path)                            | Path within the repository containing manifests                                      | `string`                                                                                                  | n/a             |   yes    |
| <a name="input_prune"></a> [prune](#input_prune)                         | Remove resources that are missing from the manifests                                 | `bool`                                                                                                    | `true`          |    no    |
| <a name="input_random_suffix"></a> [random_suffix](#input_random_suffix) | Add a random alpha-numeric suffix to resource names(prevents helm release collision) | `bool`                                                                                                    | `true`          |    no    |
| <a name="input_source_ref"></a> [source_ref](#input_source_ref)          | Source reference object                                                              | <pre>object({<br> name = string<br> namespace = optional(string)<br> kind = optional(string)<br> })</pre> | n/a             |   yes    |

## Outputs

| Name                                                           | Description                                |
| -------------------------------------------------------------- | ------------------------------------------ |
| <a name="output_manifest"></a> [manifest](#output_manifest)    | n/a                                        |
| <a name="output_name"></a> [name](#output_name)                | Name of the object with suffix(if enabled) |
| <a name="output_namespace"></a> [namespace](#output_namespace) | Namespace the object was applied to        |

<!-- END_TF_DOCS -->
