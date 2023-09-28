
resource "aws_cloudwatch_log_subscription_filter" "subscription_filter" {
  for_each = { for idx, lg in local.filtered_lgroups : idx => lg }

  name            = each.value.filter_name != "" ? each.value.filter_name : var.filter_name_overwrite
  log_group_name  = each.value.log_group_name
  filter_pattern  = each.value.filter_pattern
  role_arn        = each.value.role_arn != "" ? each.value.role_arn : var.role_arn_overwrite
  destination_arn = each.value.destination_arn != "" ? each.value.destination_arn : var.destination_arn_overwrite
}
