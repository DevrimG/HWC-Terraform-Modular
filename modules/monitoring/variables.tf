
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

variable "vpc_id" {
  type = string
}

variable "domain" {
  type    = string
  default = "devrim.com"
}
variable "enable_aom_prometheus" {
  type    = bool
  default = false
}
