
locals {
  ecs0_vpc0_name = "ecs-${var.name}-${var.env}-0"
  ecs0_vpc1_name = "ecs-${var.name}-${var.env_beta}-0"
  ecs_gpu_name   = "ecs-${var.name}-GPU"

  az1_id = "${var.region}a"
}

data "huaweicloud_compute_flavors" "small_flavour" {
  availability_zone = local.az1_id
  cpu_core_count    = 2
  memory_size       = 4
}

data "huaweicloud_compute_flavors" "medium_flavour" {
  availability_zone = local.az1_id
  cpu_core_count    = 4
  memory_size       = 16
}

data "huaweicloud_images_image" "ubuntu" {
  name        = "Ubuntu 24.04 server 64bit"
  most_recent = true
}

# ECS With Ubuntu (Alpha VPC)

resource "huaweicloud_compute_instance" "ecs0_vpc0" {
  count = var.enable_ecs_ubuntu ? 1 : 0

  name                  = local.ecs0_vpc0_name
  enterprise_project_id = var.enterprise_project_id
  power_action          = "ON"

  tags = {
    Owner = var.name
  }

  flavor_id = element(data.huaweicloud_compute_flavors.small_flavour.ids, 0)
  # flavor_id = "p3s.2xlarge.8"
  image_id = var.img_terminal
  # image_id = var.img_ubuntu
  # admin_pass = var.password
  key_pair      = "KeyPair-Devrim"
  charging_mode = var.ppu

  security_group_ids = [var.security_group_id]
  availability_zone  = local.az1_id

  network {
    source_dest_check = false
    uuid              = var.snet_pub0_vpc0_id
    fixed_ip_v4       = var.ecs0_vpc0_ip
  }

  system_disk_type = "SAS"
  system_disk_size = 100

}

resource "huaweicloud_compute_eip_associate" "associated_vpc0" {
  count = var.enable_ecs_ubuntu ? 1 : 0

  public_ip   = var.eip_ecs0_vpc0_address
  instance_id = huaweicloud_compute_instance.ecs0_vpc0[0].id
}


# ECS With Ubuntu (Beta VPC)

resource "huaweicloud_compute_instance" "ecs0_vpc1" {
  count = var.enable_ecs_beta ? 1 : 0

  name                  = local.ecs0_vpc1_name
  enterprise_project_id = var.enterprise_project_id
  power_action          = "ON"

  tags = {
    Owner = var.name
  }

  flavor_id     = element(data.huaweicloud_compute_flavors.small_flavour.ids, 0)
  image_id      = data.huaweicloud_images_image.ubuntu.id
  admin_pass    = var.password
  charging_mode = var.ppu

  security_group_ids = [var.security_group_id]
  availability_zone  = local.az1_id

  network {
    source_dest_check = false
    uuid              = var.snet_pub0_vpc1_id
    fixed_ip_v4       = var.ecs0_vpc1_ip
  }

  system_disk_type = "SAS"
  system_disk_size = 50
}

# ECS with GPU (A100 40G)

resource "huaweicloud_compute_instance" "ecs_gpu" {
  count = var.enable_ecs_gpu ? 1 : 0

  name                  = local.ecs_gpu_name
  enterprise_project_id = var.enterprise_project_id

  tags = {
    Owner = var.name
  }

  flavor_id     = element(data.huaweicloud_compute_flavors.small_flavour.ids, 0)
  image_id      = var.img_terminal
  admin_pass    = var.password
  charging_mode = var.ppu

  security_group_ids = [var.security_group_id]
  availability_zone  = local.az1_id

  network {
    source_dest_check = false
    uuid              = var.snet_pub0_vpc0_id
    fixed_ip_v4       = var.ecs_gpu_ip
  }

  system_disk_type = "SSD"
  system_disk_size = 200
}

resource "huaweicloud_compute_eip_associate" "associated_gpu" {
  count = var.enable_ecs_gpu ? 1 : 0

  public_ip   = var.eip_ecs_gpu_address
  instance_id = huaweicloud_compute_instance.ecs_gpu[0].id
}
