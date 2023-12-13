output "Apps" {
  value       = module.sumo-module
  description = "All outputs related to apps."
  sensitive = true
}

output "StagingCollection" {
  value       = module.staging-collection-module
  description = "All outputs related to staging collection and sources."
  sensitive = true
}