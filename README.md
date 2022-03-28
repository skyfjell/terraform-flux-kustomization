`sed -i '/^<!--- start terraform-docs --->/q' README.md && terraform-docs md . >> README.md`

<!--- start terraform-docs --->

## Requirements

| Name                                                                        | Version           |
| --------------------------------------------------------------------------- | ----------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | >= 2.4.1, < 3.0.0 |

## Providers

| Name                                                                  | Version           |
| --------------------------------------------------------------------- | ----------------- |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | >= 2.4.1, < 3.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                    | Type     |
| ----------------------------------------------------------------------------------------------------------------------- | -------- |
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name                                                            | Description                                                 | Type                                                                                                                | Default         | Required |
| --------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | --------------- | :------: |
| <a name="input_decryption"></a> [decryption](#input_decryption) | Provider and secret for manifest decryption                 | <pre>object({<br> provider = optional(string)<br> secret = optional(string)<br> })</pre>                            | `{}`            |    no    |
| <a name="input_interval"></a> [interval](#input_interval)       | Interval to check the repo for reconciliation               | `string`                                                                                                            | `null`          |    no    |
| <a name="input_name"></a> [name](#input_name)                   | Name of the release                                         | `string`                                                                                                            | n/a             |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)    | Namespace the release belongs to(not deployed to)           | `string`                                                                                                            | `"flux-system"` |    no    |
| <a name="input_path"></a> [path](#input_path)                   | Path within the repository containing manifests             | `string`                                                                                                            | n/a             |   yes    |
| <a name="input_prune"></a> [prune](#input_prune)                | Remove resources that are missing from the manifests        | `bool`                                                                                                              | `true`          |    no    |
| <a name="input_repository"></a> [repository](#input_repository) | Repository resource reference(GitRepository/HelmRepository) | <pre>object({<br> name = optional(string)<br> namespace = optional(string)<br> kind = optional(string)<br> })</pre> | `{}`            |    no    |

## Outputs

| Name                                                        | Description |
| ----------------------------------------------------------- | ----------- |
| <a name="output_manifest"></a> [manifest](#output_manifest) | n/a         |
