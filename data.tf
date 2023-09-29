# -------------------------------------------------------------------------------------------------
# Data sources
# -------------------------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

data "aws_cloudwatch_log_groups" "log_groups" {
  count                 = length(var.log_filters)
  log_group_name_prefix = var.log_filters[count.index].log_group_name_prefix
}
