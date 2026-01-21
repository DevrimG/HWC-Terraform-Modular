output "prometheus_write_url" {
  value       = module.monitoring.prom_remote_write_url
  description = "Remote Write URL for AOM Prometheus"
}

output "prometheus_read_url" {
  value       = module.monitoring.prom_remote_read_url
  description = "Remote Read URL for AOM Prometheus"
}
