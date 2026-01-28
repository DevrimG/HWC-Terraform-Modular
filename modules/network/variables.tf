
variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "tr-west-1"
}

variable "name" {
  description = "Project name"
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

variable "snet_cce_eni0_cidr" {
  type    = string
  default = "10.0.3.0/24"
}
variable "snet_cce_eni0_gwip" {
  type    = string
  default = "10.0.3.1"
}

variable "snet_cce_eni1_cidr" {
  type    = string
  default = "10.0.4.0/24"
}
variable "snet_cce_eni1_gwip" {
  type    = string
  default = "10.0.4.1"
}

variable "snet_cce_ap_eni0_cidr" {
  type    = string
  default = "10.0.5.0/24"
}
variable "snet_cce_ap_eni0_gwip" {
  type    = string
  default = "10.0.5.1"
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

variable "er0_name" {
  type    = string
  default = "er-devrim"
}

variable "bgp_asn0" {
  type    = string
  default = "64512"
}

# Security Group Vars (needed for rules)
variable "ingress" { default = "ingress" }
variable "ipv4" { default = "IPv4" }
variable "sg_internet" { default = "0.0.0.0/0" }
variable "sg_guest_ip" { default = "0.0.0.0/0" } # Update with actual default if known or pass from root
variable "sg_vpn_ip" { default = "0.0.0.0/0" }   # Update with actual default if known or pass from root

# Feature Flags for Network Resources
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

variable "enable_eip_ecs_ubuntu" {
  description = "Enable EIP for ECS Ubuntu"
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

variable "elb_l4_flavour" {
  description = "L4 Flavor ID for Network Load Balancer"
  type        = string
  default     = "abb6e65b-5478-433c-bdb1-25c0e1bd4289"
}

variable "elb_l7_flavour" {
  description = "L7 Flavor ID for Application Load Balancer"
  type        = string
  default     = "9bae3ddd-f706-4707-b7aa-b2510482e448"
}

variable "enable_nat_gateway_alpha" {
  description = "Enable NAT Gateway for Alpha VPC (VPC0)"
  type        = bool
  default     = false
}

variable "enable_eip_nat_alpha" {
  description = "Enable EIP for Alpha VPC NAT Gateway"
  type        = bool
  default     = false
}
