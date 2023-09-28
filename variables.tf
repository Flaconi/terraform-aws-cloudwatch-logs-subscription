variable "filter_name_overwrite" {
  type        = string
  default     = "logfilter"
  description = "Name overwrite for filter subscriptions."
}

variable "destination_arn_overwrite" {
  type        = string
  description = "ARN of the destination (overwrite for omitted destination_arn in log_filters)"
  default     = ""
}

variable "role_arn_overwrite" {
  type        = string
  description = "ARN of the role to use for subscription"
  default     = ""
}

variable "log_filters" {
  type = list(object({
    log_group_name_prefix = string                     # Prefix or name of the loggroup(s)
    filter_name           = optional(string, "")       # Name of the subscription filter
    role_arn              = optional(string, "")       # role ARN to use for subscription
    destination_arn       = optional(string, "")       # ARN of the destination used for all filter subscriptions (e.g., Lambda function, Kinesis stream, etc.)
    filter_pattern        = optional(string, "")       # metric filters, subscription filters, and filter log events
    exclusion_pattern     = optional(list(string), []) # regex to exclude specific log groups which matches.
  }))
  description = "Object to define log filters."
}
