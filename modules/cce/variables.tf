variable "region" {
  description = "Region"
  type        = string
  default     = "tr-west-1"
}

variable "name" {
  description = "Project Name"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "enterprise_project_id" {
  description = "Enterprise Project ID"
  type        = string
  default     = "d92681a8-2539-4385-b213-d45c4d8a87d1"
}

variable "cce_version" {
  type    = string
  default = "v1.32"
}

variable "cce_master_single" {
  type    = string
  default = "cce.s1.small"
}

variable "vpc_id" {
  description = "VPC ID for CCE"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for CCE Master/Nodes"
  type        = string
}

variable "eni_subnet_ids" {
  description = "List of ENI Subnet IDs for CCE Turbo"
  type        = list(string)
  default     = []
}

variable "cce_ap_eni_subnet_id" {
  description = "ENI Subnet ID for CCE Autopilot"
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "Security Group ID for Node Pool"
  type        = string
  default     = ""
}

variable "cce_eni_sg_id" {
  description = "Security Group ID for CCE ENI"
  type        = string
  default     = ""
}

variable "password" {
  description = "Node Password"
  type        = string
  sensitive   = true
  default     = ""
}

variable "img_ubuntu" {
  description = "Ubuntu Image"
  type        = string
  default     = "Ubuntu 22.04"
}

variable "swr_user" {
  description = "SWR Username"
  type        = string
  default     = ""
}

variable "swr_password" {
  description = "SWR Password"
  type        = string
  sensitive   = true
  default     = ""
}
variable "enable_cce_cluster" {
  type    = bool
  default = false
}

variable "enable_cce_node_pool" {
  type    = bool
  default = false
}

variable "enable_cce_autopilot" {
  type    = bool
  default = false
}

variable "vpc0_cidr" { default = "" }
variable "vpc1_cidr" { default = "" }
variable "vpc2_cidr" { default = "" }
variable "sg_internet" { default = "0.0.0.0/0" }
variable "sg_guest_ip" { default = "" }
variable "sg_vpn_ip" { default = "" }
variable "enable_vpn_sg_rule" { default = false }
variable "my_ip" { default = "" }
variable "cce_eip_address" { default = "" }
