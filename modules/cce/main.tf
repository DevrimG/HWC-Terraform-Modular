
locals {
  cce_cluster0_name    = "cce-${var.name}-${var.env}-cluster"
  cce_spot_pool_name   = "cce-${var.name}-${var.env}-spot-pool"
  cce_ap_cluster0_name = "cce-ap-${var.name}-${var.env}-cluster"

  az1_id = "${var.region}a"
  az2_id = "${var.region}b"
  az3_id = "${var.region}c"
}

resource "huaweicloud_cce_cluster" "cce-cluster0" {
  count           = var.enable_cce_cluster ? 1 : 0
  name            = local.cce_cluster0_name
  flavor_id       = var.cce_master_single
  cluster_version = var.cce_version
  vpc_id          = var.vpc_id
  subnet_id       = var.subnet_id
  hibernate       = false

  tags = {
    Owner = var.name
  }

  container_network_type = "eni"
  eni_subnet_id          = join(",", var.eni_subnet_ids)

  enterprise_project_id = var.enterprise_project_id
  authentication_mode   = "rbac"

  masters {
    availability_zone = local.az1_id
  }
}




resource "huaweicloud_cce_namespace" "frontend" {
  count      = var.enable_cce_cluster ? 1 : 0
  cluster_id = huaweicloud_cce_cluster.cce-cluster0[0].id
  name       = "frontend"
}

resource "huaweicloud_cce_namespace" "backend" {
  count      = var.enable_cce_cluster ? 1 : 0
  cluster_id = huaweicloud_cce_cluster.cce-cluster0[0].id
  name       = "backend"
}

resource "huaweicloud_cce_namespace" "agent-watch" {
  count      = var.enable_cce_cluster ? 1 : 0
  cluster_id = huaweicloud_cce_cluster.cce-cluster0[0].id
  name       = "agent-watch"
}



data "huaweicloud_compute_flavors" "medium_flavour" {
  availability_zone = local.az1_id
  performance_type  = "normal"
  cpu_core_count    = 8
  memory_size       = 16
}


resource "huaweicloud_cce_node_pool" "cce_spot_pool" {
  count           = (var.enable_cce_cluster && var.enable_cce_node_pool) ? 1 : 0
  cluster_id      = huaweicloud_cce_cluster.cce-cluster0[0].id
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]

  name     = local.cce_spot_pool_name
  password = var.password

  os                = var.img_ubuntu
  flavor_id         = data.huaweicloud_compute_flavors.medium_flavour.flavors[0].id
  type              = "vm"
  availability_zone = local.az1_id
  runtime           = "containerd"

  scall_enable             = true
  initial_node_count       = 1
  min_node_count           = 0
  max_node_count           = 5
  scale_down_cooldown_time = 0
  priority                 = 0

  root_volume {
    size       = 40
    volumetype = "SAS"
  }

  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}

### CCE Addons ###

resource "huaweicloud_cce_addon" "addon_metrics_server" {
  count         = (var.enable_cce_cluster && var.enable_cce_node_pool) ? 1 : 0
  cluster_id    = huaweicloud_cce_cluster.cce-cluster0[0].id
  template_name = "metrics-server"
  version       = "1.3.90"

  depends_on = [huaweicloud_cce_node_pool.cce_spot_pool]
}

### Autopilot (from cce.autopilot.tf) ###

resource "huaweicloud_cce_autopilot_cluster" "cce-cluster1" {
  count                   = var.enable_cce_autopilot ? 1 : 0
  name                    = local.cce_ap_cluster0_name
  flavor                  = "cce.autopilot.cluster"
  enable_swr_image_access = true
  tags = {
    Owner = var.name
  }
  host_network {
    vpc    = var.vpc_id
    subnet = var.subnet_id
  }
  container_network {
    mode = "eni"
  }
  eni_network {
    subnets {
      subnet_id = var.cce_ap_eni_subnet_id
    }
  }
  authentication {
    mode = "rbac"
  }
  extend_param {
    enterprise_project_id = var.enterprise_project_id
  }
}
