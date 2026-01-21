
# Consolidated Variables

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "tr-west-1"
}

variable "name" {
  description = "devrim"
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "env_beta" {
  description = "Beta Environment name"
  type        = string
  default     = "beta"
}

variable "env_net" {
  description = "Network Environment name"
  type        = string
  default     = "net"
}

variable "domain" {
  description = "Domain name"
  type        = string
  default     = "devrim.com"
}

variable "enterprise_project_id" {
  description = "Enterprise Project ID"
  type        = string
  default     = "d92681a8-2539-4385-b213-d45c4d8a87d1"
}

variable "access_key" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "password" {
  description = "Common Password"
  type        = string
  sensitive   = true
}

# --- Network Vars (from vars.network.tf) ---

variable "vpc0_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "snet_pub0_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "snet_pub0_gwip" {
  type    = string
  default = "10.0.1.1"
}

variable "snet_pvt0_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "snet_pvt0_gwip" {
  type    = string
  default = "10.0.2.1"
}

variable "snet_eric_vpc0_cidr" {
  type    = string
  default = "10.0.20.0/24"
}

variable "snet_eric_vpc0_gwip" {
  type    = string
  default = "10.0.20.1"
}

variable "primary_dns" {
  type    = string
  default = "100.125.2.250"
}

variable "secondary_dns" {
  type    = string
  default = "100.125.2.251"
}

variable "vpc1_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "snet_pub0_vpc1_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

variable "snet_pub0_vpc1_gwip" {
  type    = string
  default = "10.10.1.1"
}

variable "er0_name" {
  type    = string
  default = "er-devrim"
}

variable "bgp_asn0" {
  type    = string
  default = "64512"
}

variable "snet_eric_vpc1_cidr" {
  type    = string
  default = "10.10.20.0/24"
}

variable "snet_eric_vpc1_gwip" {
  type    = string
  default = "10.10.20.1"
}

variable "vpc2_cidr" {
  type    = string
  default = "10.255.0.0/16"
}

variable "snet_pub0_vpc2_cidr" {
  type    = string
  default = "10.255.1.0/24"
}

variable "snet_pub0_vpc2_gwip" {
  type    = string
  default = "10.255.1.1"
}

variable "snet_pub1_vpc2_cidr" {
  type    = string
  default = "10.255.30.0/24"
}

variable "snet_pub1_vpc2_gwip" {
  type    = string
  default = "10.255.30.1"
}

variable "snet_eric_vpc2_cidr" {
  type    = string
  default = "10.255.20.0/24"
}

variable "snet_eric_vpc2_gwip" {
  type    = string
  default = "10.255.20.1"
}

# --- CCE Vars (from vars.cce.tf) ---

variable "cce_master_ha" {
  description = "Type of CCE Cluster"
  type        = string
  default     = "cce.s2.small"
}

variable "cce_master_single" {
  description = "Type of CCE Cluster"
  type        = string
  default     = "cce.s1.small"
}

variable "snet_cce_eni0_cidr" {
  type    = string
  default = "10.0.4.0/22"
}

variable "snet_cce_eni0_gwip" {
  type    = string
  default = "10.0.4.1"
}

variable "snet_cce_eni1_cidr" {
  type    = string
  default = "10.0.8.0/22"
}

variable "snet_cce_eni1_gwip" {
  type    = string
  default = "10.0.8.1"
}

variable "snet_cce_ap_eni0_cidr" {
  type    = string
  default = "10.0.40.0/22"
}

variable "snet_cce_ap_eni0_gwip" {
  type    = string
  default = "10.0.40.1"
}

# --- Flavors & Images (from vars.flavours.tf / vars.images.tf) ---

variable "ppu" {
  description = "Pay per use"
  type        = string
  default     = "postPaid"
}

variable "spot" {
  description = "Spot"
  type        = string
  default     = "spot"
}

variable "elb_l4_flavour" {
  type    = string
  default = "abb6e65b-5478-433c-bdb1-25c0e1bd4289"
}

variable "elb_l7_flavour" {
  type    = string
  default = "9bae3ddd-f706-4707-b7aa-b2510482e448"
}

variable "img_ubuntu" {
  description = "Ubuntu Public Image for ECS"
  type        = string
  default     = "Ubuntu 22.04"
}

variable "img_terminal" {
  description = "Terminal Server Private Image"
  type        = string
  default     = "51f63c24-cd47-4c41-9705-305a0777f972"
}

variable "img_ComfyUI" {
  description = "ComfyUI Private Image"
  type        = string
  default     = "2752a610-8c60-4b64-a715-74d40a18fbfa"
}

variable "img_ollama8b" {
  type    = string
  default = "215d2372-08e1-45e6-9bbc-d6945a5d44b3"
}

variable "img_fg_blender_client" {
  type    = string
  default = "ca9630d7-1dd5-450d-a137-8134b83e03b6"
}

variable "swr_fg_blender_app" {
  type    = string
  default = "swr.tr-west-1.myhuaweicloud.com/devrim/blender-api-function:amd64"
}

# --- IPS (from vars.ips.tf) ---

variable "ecs0_vpc0_ip" {
  type    = string
  default = "10.0.1.10"
}

variable "ecs0_vpc1_ip" {
  type    = string
  default = "10.10.1.10"
}

variable "ecs_gpu_ip" {
  type    = string
  default = "10.0.1.11"
}

variable "ip_redis0" {
  type    = string
  default = "10.0.2.200"
}

variable "sg_vpn_ip" {
  type    = string
  default = "172.16.0.13/32"
}

variable "sg_internet" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ipv4" {
  type    = string
  default = "IPv4"
}

variable "ingress" {
  type    = string
  default = "ingress"
}

variable "sg_guest_ip" {
  type    = string
  default = "176.53.15.248/32"
}

# --- Ports (from vars.ports.tf) ---

variable "app_port" {
  type    = string
  default = "5000"
}

variable "redis_port" {
  type    = string
  default = "6379"
}

variable "rabbitmq_port" {
  type    = string
  default = "5672"
}

variable "pgsql_port" {
  type    = string
  default = "5432"
}

# --- Secrets (Placeholder for vars.secrets.tf contents, usually sensitive) ---
# variable "additional_secrets" { ... }

# --- Storage / Versions ---

variable "redis_version" {
  type    = string
  default = "6.0"
}

variable "cce_version" {
  description = "Version of CCE Cluster"
  type        = string
  default     = "v1.32"
}

variable "css_version" {
  type    = string
  default = "7.10.2"
}

# Feature Flags
variable "enable_ecs_ubuntu" {
  description = "Enable ECS Ubuntu Instance"
  type        = bool
  default     = false
}
variable "enable_cce_cluster" { default = false }
variable "enable_cce_node_pool" { default = false }
variable "enable_cce_autopilot" { default = false }
variable "enable_ecs_beta" { default = false }
variable "enable_ecs_gpu" { default = false }
variable "enable_redis_single" { default = false }
variable "enable_css_cluster" { default = false }
variable "enable_apigw_basic" { default = false }
variable "enable_function_blender" { default = false }
variable "enable_aom_prometheus" {
  type    = bool
  default = false
}

# Network Feature Flags
variable "enable_vpc_beta" {
  description = "Enable VPC Beta (VPC1) and its subnets"
  type        = bool
  default     = false
}

variable "enable_vpc_net" {
  description = "Enable VPC Network (VPC2) and its subnets"
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway and SNAT rules"
  type        = bool
  default     = false
}

variable "enable_vpn_sg_rule" {
  description = "Enable VPN security group rule"
  type        = bool
  default     = false
}

variable "enable_eip_nat" {
  description = "Enable EIP for NAT Gateway"
  type        = bool
  default     = false
}

variable "enable_eip_ecs_vpc1" {
  description = "Enable EIP for ECS in VPC1 (Beta)"
  type        = bool
  default     = false
}

variable "enable_eip_cce" {
  description = "Enable EIP for CCE cluster"
  type        = bool
  default     = false
}

variable "enable_eip_cce_ap" {
  description = "Enable EIP for CCE Autopilot cluster"
  type        = bool
  default     = false
}

variable "enable_eip_elb" {
  description = "Enable EIP for Elastic Load Balancer"
  type        = bool
  default     = false
}

variable "enable_network_acl" {
  description = "Enable Network ACL resources"
  type        = bool
  default     = false
}

variable "enable_enterprise_router" {
  description = "Enable Enterprise Router and attachments"
  type        = bool
  default     = false
}

variable "enable_load_balancer" {
  description = "Enable Elastic Load Balancer"
  type        = bool
  default     = false
}

variable "enable_snet_eric_vpc0" {
  description = "Enable Eric subnet for VPC0"
  type        = bool
  default     = false
}
