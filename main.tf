terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.72.0"
    }
  }

  backend "s3" {}
}

provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "network" {
  source = "./modules/network"

  name = var.name
  env  = var.env


  enterprise_project_id = var.enterprise_project_id
  domain                = var.domain

  vpc0_cidr      = var.vpc0_cidr
  snet_pub0_cidr = var.snet_pub0_cidr
  snet_pub0_gwip = var.snet_pub0_gwip
  snet_pvt0_cidr = var.snet_pvt0_cidr
  snet_pvt0_gwip = var.snet_pvt0_gwip

  snet_eric_vpc0_cidr = var.snet_eric_vpc0_cidr
  snet_eric_vpc0_gwip = var.snet_eric_vpc0_gwip

  snet_cce_eni0_cidr    = var.snet_cce_eni0_cidr
  snet_cce_eni0_gwip    = var.snet_cce_eni0_gwip
  snet_cce_eni1_cidr    = var.snet_cce_eni1_cidr
  snet_cce_eni1_gwip    = var.snet_cce_eni1_gwip
  snet_cce_ap_eni0_cidr = var.snet_cce_ap_eni0_cidr
  snet_cce_ap_eni0_gwip = var.snet_cce_ap_eni0_gwip

  primary_dns   = var.primary_dns
  secondary_dns = var.secondary_dns

  vpc1_cidr           = var.vpc1_cidr
  snet_pub0_vpc1_cidr = var.snet_pub0_vpc1_cidr
  snet_pub0_vpc1_gwip = var.snet_pub0_vpc1_gwip
  snet_eric_vpc1_cidr = var.snet_eric_vpc1_cidr
  snet_eric_vpc1_gwip = var.snet_eric_vpc1_gwip

  vpc2_cidr           = var.vpc2_cidr
  snet_pub0_vpc2_cidr = var.snet_pub0_vpc2_cidr
  snet_pub0_vpc2_gwip = var.snet_pub0_vpc2_gwip
  snet_pub1_vpc2_cidr = var.snet_pub1_vpc2_cidr
  snet_pub1_vpc2_gwip = var.snet_pub1_vpc2_gwip
  snet_eric_vpc2_cidr = var.snet_eric_vpc2_cidr
  snet_eric_vpc2_gwip = var.snet_eric_vpc2_gwip

  er0_name = var.er0_name
  bgp_asn0 = var.bgp_asn0

  sg_guest_ip = var.sg_guest_ip
  sg_vpn_ip   = var.sg_vpn_ip
  sg_internet = var.sg_internet

  # Network Feature Flags
  enable_vpc_beta          = var.enable_vpc_beta
  enable_vpc_net           = var.enable_vpc_net
  enable_nat_gateway       = var.enable_nat_gateway
  enable_vpn_sg_rule       = var.enable_vpn_sg_rule
  enable_eip_nat           = var.enable_eip_nat
  enable_eip_ecs_vpc1      = var.enable_eip_ecs_vpc1
  enable_eip_cce           = var.enable_eip_cce
  enable_eip_cce_ap        = var.enable_eip_cce_ap
  enable_eip_elb           = var.enable_eip_elb
  enable_network_acl       = var.enable_network_acl
  enable_enterprise_router = var.enable_enterprise_router
  enable_load_balancer     = var.enable_load_balancer
  enable_snet_eric_vpc0    = var.enable_snet_eric_vpc0

}

module "cce" {
  source = "./modules/cce"

  name                  = var.name
  env                   = var.env
  enterprise_project_id = var.enterprise_project_id
  region                = var.region

  vpc_id    = module.network.vpc0_id
  subnet_id = module.network.snet_pub0_vpc0_id
  eni_subnet_ids = [
    module.network.vpc0_eni0_cce_ipv4_subnet_id,
    module.network.vpc0_eni1_cce_ipv4_subnet_id
  ]
  cce_ap_eni_subnet_id = module.network.vpc0_eni_cce_ap0_ipv4_subnet_id
  security_group_id    = module.network.secgroup_public0_id

  password = var.password
  # swr_user = var.swr_user 
  # swr_password = var.swr_password

  # Feature Flags
  enable_cce_cluster   = var.enable_cce_cluster
  enable_cce_node_pool = var.enable_cce_node_pool
  enable_cce_autopilot = var.enable_cce_autopilot
}

module "compute" {
  source = "./modules/compute"

  name                  = var.name
  env                   = var.env
  enterprise_project_id = var.enterprise_project_id
  region                = var.region
  password              = var.password

  snet_pub0_vpc0_id = module.network.snet_pub0_vpc0_id
  security_group_id = module.network.secgroup_public0_id

  eip_ecs0_vpc0_address = module.network.eip_ecs0_vpc0_address


  # Feature Flags
  enable_ecs_ubuntu = var.enable_ecs_ubuntu
  enable_ecs_beta   = var.enable_ecs_beta
  enable_ecs_gpu    = var.enable_ecs_gpu
}

module "database" {
  source = "./modules/database"

  name                  = var.name
  env                   = var.env
  enterprise_project_id = var.enterprise_project_id
  region                = var.region
  password              = var.password

  vpc_id            = module.network.vpc0_id
  subnet_id         = module.network.snet_pvt0_vpc0_id
  security_group_id = module.network.secgroup_public0_id

  ip_redis0 = var.ip_redis0

  # Feature Flags
  enable_redis_single = var.enable_redis_single
  enable_css_cluster  = var.enable_css_cluster
}

module "monitoring" {
  source = "./modules/monitoring"

  name                  = var.name
  env                   = var.env
  enterprise_project_id = var.enterprise_project_id
  region                = var.region

  vpc_id = module.network.vpc0_id
  domain = var.domain

  # Feature Flags
  enable_aom_prometheus = var.enable_aom_prometheus
}

module "storage" {
  source                = "./modules/storage"
  enterprise_project_id = var.enterprise_project_id
}

module "functiongraph" {
  source = "./modules/functiongraph"

  name                  = var.name
  enterprise_project_id = var.enterprise_project_id

  vpc_id            = module.network.vpc0_id
  subnet_id         = module.network.snet_pvt0_vpc0_id
  security_group_id = module.network.secgroup_public0_id

  fg-blender-app = var.swr_fg_blender_app

  # Feature Flags
  enable_function_blender = var.enable_function_blender
}

module "apigw" {
  source = "./modules/apigw"

  name                  = var.name
  env                   = var.env
  enterprise_project_id = var.enterprise_project_id
  region                = var.region

  vpc_id            = module.network.vpc0_id
  subnet_id         = module.network.snet_pub0_vpc0_id
  security_group_id = module.network.secgroup_public0_id

  # Feature Flags
  enable_apigw_basic = var.enable_apigw_basic
}

