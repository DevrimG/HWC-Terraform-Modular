
locals {
  apigw_instance_name = "apigw-${var.name}-${var.env}"
  az1_id              = "${var.region}a"
  az2_id              = "${var.region}b"
}

resource "huaweicloud_apig_instance" "apigw_instance0" {
  count                 = var.enable_apigw_basic ? 1 : 0
  name                  = local.apigw_instance_name
  edition               = "BASIC"
  enterprise_project_id = var.enterprise_project_id

  vpc_id             = var.vpc_id
  subnet_id          = var.subnet_id
  security_group_id  = var.security_group_id
  availability_zones = [local.az1_id, local.az2_id]

}
