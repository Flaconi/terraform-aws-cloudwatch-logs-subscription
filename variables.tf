variable "default_filter_name" {
  type        = string
  default     = "logfilter"
  description = "default filter name if filter_name is omitted in log_filters"
}

variable "default_destination_arn" {
  type        = string
  description = "default ARN of destination if destination_arn is omitted in log_filters"
  default     = ""
}

variable "default_role_arn" {
  type        = string
  description = "default ARN of the role if role_arn is omitted in log_filters"
  default     = ""
}

variable "log_filters" {
  type = list(object({
    log_group_name_prefix = string                     # Prefix or name of the loggroup(s)
    filter_name           = optional(string, "")       # Name of the subscription filter
    role_arn              = optional(string, "")       # role ARN to use for subscription
    destination_arn       = optional(string, "")       # ARN of the destination used for all filter subscriptions (e.g., Lambda function, Kinesis stream, etc.)
    filter_pattern        = optional(string, "")       # metric filters, subscription filters, and filter log events
    exclusion_pattern     = optional(list(string), []) # regex to exclude specific log groups which matches
  }))
  description = "List of objects to define log filters"
}
