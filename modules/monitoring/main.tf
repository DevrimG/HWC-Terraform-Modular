
locals {
  log_group0_name    = "log-group-${var.name}-${var.env}-v2"
  log_stream0_name   = "log-stream-${var.name}-${var.env}-v2"
  vpc0_flow_log_name = "log-vpc-${var.name}-${var.env}-flow-v2"
}

resource "huaweicloud_lts_group" "log-group0" {
  group_name            = local.log_group0_name
  ttl_in_days           = 30
  enterprise_project_id = var.enterprise_project_id
}

resource "huaweicloud_lts_stream" "log-stream0-network" {
  group_id              = huaweicloud_lts_group.log-group0.id
  stream_name           = local.log_stream0_name
  enterprise_project_id = var.enterprise_project_id
}

resource "huaweicloud_vpc_flow_log" "log-vpc0-flow" {
  name          = local.vpc0_flow_log_name
  resource_type = "vpc"
  resource_id   = var.vpc_id
  traffic_type  = "all"
  log_group_id  = huaweicloud_lts_group.log-group0.id
  log_stream_id = huaweicloud_lts_stream.log-stream0-network.id
}

# Monitoring (Empty/Commented placeholder)
# Prometheus Instance
resource "huaweicloud_aom_prom_instance" "prom_instance" {
  count                 = var.enable_aom_prometheus ? 1 : 0
  prom_name             = "prom-${var.name}-${var.env}"
  prom_type             = "REMOTE_WRITE"
  enterprise_project_id = var.enterprise_project_id
}
