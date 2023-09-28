# -------------------------------------------------------------------------------------------------
# Locals
# -------------------------------------------------------------------------------------------------

locals {
  tags = {
    Project = "cwdata"
  }


  #    exclusion_pattern = var.exclusion_pattern
  #
  #    relevant_groupnames = [ for item in data.aws_cloudwatch_log_groups.example.log_group_names :
  #      item if !anytrue([ for exclusion_pattern in local.exclusion_pattern : can(regex(exclusion_pattern, item))])
  #    ]

  matched_lgroups = flatten([
    for idx, filter in var.log_filters : [
      for log_group in data.aws_cloudwatch_log_groups.log_groups[idx].log_group_names :
      {
        filter_name       = filter.filter_name
        log_group_name    = log_group
        filter_pattern    = filter.filter_pattern
        exclusion_pattern = filter.exclusion_pattern
        destination_arn   = filter.destination_arn
        role_arn          = filter.role_arn
    }]
    ]
  )

  filtered_lgroups = [
    for lgroup in local.matched_lgroups :
    {
      filter_name       = lgroup.filter_name
      log_group_name    = lgroup.log_group_name
      filter_pattern    = lgroup.filter_pattern
      exclusion_pattern = lgroup.exclusion_pattern
      destination_arn   = lgroup.destination_arn
      role_arn          = lgroup.role_arn
    }
    if !anytrue([for pattern in lgroup.exclusion_pattern : can(regex(pattern, lgroup.log_group_name))])
  ]
}
