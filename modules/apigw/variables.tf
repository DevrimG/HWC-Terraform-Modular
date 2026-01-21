variable "name" {}
variable "env" {}
variable "enterprise_project_id" { default = "0" }
variable "region" { default = "tr-west-1" }
variable "vpc_id" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "enable_apigw_basic" {
  type    = bool
  default = false
}
