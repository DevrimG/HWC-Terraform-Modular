
locals {
  redis_single_name = "redis-${var.name}-${var.env}-single"
  css_single_name   = "css-${var.name}-${var.env}-single"
  az1_id            = "${var.region}a"
}

# Query the available flavors of the specified capacity.

data "huaweicloud_dcs_flavors" "single_flavors" {
  cache_mode = "single"
  capacity   = 0.25
}

# Create Single-node Redis instance

resource "huaweicloud_dcs_instance" "redis_single" {
  count = var.enable_redis_single ? 1 : 0
  name  = local.redis_single_name

  engine         = "Redis"
  engine_version = var.redis_version
  tags = {
    Owner = var.name
  }

  capacity = data.huaweicloud_dcs_flavors.single_flavors.capacity
  flavor   = data.huaweicloud_dcs_flavors.single_flavors.flavors[0].name

  availability_zones = [
    local.az1_id
  ]

  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id

  enterprise_project_id = var.enterprise_project_id
  password              = var.password
  charging_mode         = var.ppu

  ssl_enable = false
  private_ip = var.ip_redis0
  port       = var.redis_port

}

### Elastic Search (from elastic.search.tf) ###

resource "huaweicloud_css_cluster" "css_single_cluster" {
  count                 = var.enable_css_cluster ? 1 : 0
  enterprise_project_id = var.enterprise_project_id
  name                  = local.css_single_name
  charging_mode         = var.ppu
  tags = {
    Owner = var.name
  }

  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  engine_type       = "elasticsearch"
  engine_version    = "7.10.2"

  ess_node_config {
    flavor          = "ess.spec-4u8g"
    instance_number = 1

    volume {
      volume_type = "HIGH"
      size        = 40
    }
  }


}
