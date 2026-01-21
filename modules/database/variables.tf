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

variable "enterprise_project_id" {
  type    = string
  default = "0"
}

variable "password" {
  type      = string
  sensitive = true
}

variable "ppu" {
  type    = string
  default = "postPaid"
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "redis_version" {
  type    = string
  default = "6.0"
}

variable "ip_redis0" {
  type    = string
  default = "10.0.2.200"
}

variable "redis_port" {
  type    = string
  default = "6379"
}
variable "enable_redis_single" {
  type    = bool
  default = false
}
variable "enable_css_cluster" {
  type    = bool
  default = false
}
