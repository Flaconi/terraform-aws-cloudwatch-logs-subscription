output "creator" {
  value = data.aws_caller_identity.current.user_id
}

output "filtered_lgroups" {
  value = local.filtered_lgroups
}
