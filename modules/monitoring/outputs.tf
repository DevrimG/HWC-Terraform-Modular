output "log_group_id" {
  value = huaweicloud_lts_group.log-group0.id
}

output "log_stream_id" {
  value = huaweicloud_lts_stream.log-stream0-network.id
}
output "prom_instance_id" {
  value = try(huaweicloud_aom_prom_instance.prom_instance[0].id, "")
}

output "prom_remote_write_url" {
  value = try(huaweicloud_aom_prom_instance.prom_instance[0].remote_write_url, "")
}

output "prom_remote_read_url" {
  value = try(huaweicloud_aom_prom_instance.prom_instance[0].remote_read_url, "")
}

output "prom_http_api_endpoint" {
  value = try(huaweicloud_aom_prom_instance.prom_instance[0].prom_http_api_endpoint, "")
}
