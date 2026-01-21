locals {
  redis_single_name = "redis-${var.name}-${var.env}-single"
  css_single_name   = "css-${var.name}-${var.env}-single"
  az1_id            = "${var.region}a"
}

# Query available single-node Redis flavors with 1GB capacity
data "huaweicloud_dcs_flavors" "single_flavors" {
  cache_mode = "single"
  capacity   = 1
}

# Query available CSS flavors
data "huaweicloud_css_flavors" "css_flavors" {
  type    = "ess"
  version = "7.10.2"
}

resource "huaweicloud_dcs_instance" "redis_single" {
  count = var.enable_redis_single ? 1 : 0
  name  = local.redis_single_name

  engine         = "Redis"
  engine_version = var.redis_version
  tags = {
    Owner = var.name
  }

  # Use the first available flavor from the data source
  capacity = try(data.huaweicloud_dcs_flavors.single_flavors.flavors[0].capacity, 1)
  flavor   = try(data.huaweicloud_dcs_flavors.single_flavors.flavors[0].name, null)

  availability_zones = try(
    [data.huaweicloud_dcs_flavors.single_flavors.flavors[0].available_zones[0]],
    [local.az1_id]
  )

  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id

  enterprise_project_id = var.enterprise_project_id
  password              = var.password
  charging_mode         = var.ppu

  ssl_enable = false
  private_ip = var.ip_redis0
  port       = var.redis_port
}

### Elastic Search ###

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
  availability_zone = local.az1_id
  engine_type       = "elasticsearch"
  engine_version    = "7.10.2"

  ess_node_config {
    flavor          = try(data.huaweicloud_css_flavors.css_flavors.flavors[0].name, "ess.spec-4u8g")
    instance_number = 1

    volume {
      volume_type = "HIGH"
      size        = 100
    }
  }
}

output "available_redis_flavors" {
  value = [for f in data.huaweicloud_dcs_flavors.single_flavors.flavors : {
    name            = f.name
    capacity        = f.capacity
    available_zones = f.available_zones
  }]
  description = "List of available Redis single-node flavors"
}

output "available_css_flavors" {
  value = [for f in data.huaweicloud_css_flavors.css_flavors.flavors : {
    name   = f.name
    memory = f.memory
    vcpus  = f.vcpus
  }]
  description = "List of available CSS flavors"
}
