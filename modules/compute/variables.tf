variable "region" {
  type    = string
  default = "tr-west-1"
}

variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "env_beta" {
  type    = string
  default = "beta"
}

variable "enterprise_project_id" {
  type    = string
  default = "0"
}

variable "password" {
  type      = string
  sensitive = true
  default   = ""
}

variable "ppu" {
  type    = string
  default = "postPaid"
}

variable "img_terminal" {
  type    = string
  default = "51f63c24-cd47-4c41-9705-305a0777f972"
}

variable "img_ubuntu" {
  type    = string
  default = "Ubuntu 22.04"
}

variable "snet_pub0_vpc0_id" {
  type = string
}

variable "ecs0_vpc0_ip" {
  type    = string
  default = "10.0.1.10"
}

variable "eip_ecs0_vpc0_address" {
  type    = string
  default = ""
}

variable "snet_pub0_vpc1_id" {
  type    = string
  default = ""
}

variable "ecs0_vpc1_ip" {
  type    = string
  default = "10.10.1.10"
}

variable "security_group_id" {
  type = string
}

variable "ecs_gpu_ip" {
  type    = string
  default = "10.0.1.11"
}

variable "eip_ecs_gpu_address" {
  type    = string
  default = ""
}

# Feature Flags
variable "enable_ecs_ubuntu" {
  description = "Enable ECS Ubuntu Instance"
  type        = bool
  default     = false
}
variable "enable_ecs_beta" {
  type    = bool
  default = false
}

variable "enable_ecs_gpu" {
  type    = bool
  default = false
}
