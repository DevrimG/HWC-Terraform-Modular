variable "name" {}
variable "enterprise_project_id" { default = "0" }
variable "vpc_id" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "fg-blender-app" {
  type    = string
  default = "default_url"
}
variable "enable_function_blender" {
  type    = bool
  default = false
}
