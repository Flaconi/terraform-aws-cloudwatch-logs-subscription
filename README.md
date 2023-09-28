# terraform-module-template
Template for Terraform modules

<!-- Uncomment and replace with your module name
[![lint](https://github.com/flaconi/<MODULENAME>/workflows/lint/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/<MODULENAME>/workflows/test/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/<MODULENAME>.svg)](https://github.com/flaconi/<MODULENAME>/releases)
-->
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_log_filters"></a> [log\_filters](#input\_log\_filters)

Description: Object to define log filters.

Type:

```hcl
list(object({
    log_group_name_prefix = string                     # Prefix or name of the loggroup(s)
    filter_name           = optional(string, "")       # Name of the subscription filter
    role_arn              = optional(string, "")       # role ARN to use for subscription
    destination_arn       = optional(string, "")       # ARN of the destination used for all filter subscriptions (e.g., Lambda function, Kinesis stream, etc.)
    filter_pattern        = optional(string, "")       # metric filters, subscription filters, and filter log events
    exclusion_pattern     = optional(list(string), []) # regex to exclude specific log groups which matches.
  }))
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_filter_name_overwrite"></a> [filter\_name\_overwrite](#input\_filter\_name\_overwrite)

Description: Name overwrite for filter subscriptions.

Type: `string`

Default: `"logfilter"`

### <a name="input_destination_arn_overwrite"></a> [destination\_arn\_overwrite](#input\_destination\_arn\_overwrite)

Description: ARN of the destination (overwrite for omitted destination\_arn in log\_filters)

Type: `string`

Default: `""`

### <a name="input_role_arn_overwrite"></a> [role\_arn\_overwrite](#input\_role\_arn\_overwrite)

Description: ARN of the role to use for subscription

Type: `string`

Default: `""`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_creator"></a> [creator](#output\_creator) | n/a |
| <a name="output_filtered_lgroups"></a> [filtered\_lgroups](#output\_filtered\_lgroups) | n/a |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2023 **[Flaconi GmbH](https://github.com/flaconi)**
