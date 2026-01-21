resource "huaweicloud_dns_zone" "private_dns_zone" {
  name                  = local.dns_private_zone
  zone_type             = "private"
  enterprise_project_id = var.enterprise_project_id
  tags = {
    Owner = var.name
  }


  router {
    router_id = huaweicloud_vpc.vpc0_devrim.id
  }
}