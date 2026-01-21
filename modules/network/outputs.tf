output "vpc0_id" {
  value = huaweicloud_vpc.vpc0_devrim.id
}

output "snet_pub0_vpc0_id" {
  value = huaweicloud_vpc_subnet.snet_pub0_vpc0.id
}

output "snet_pvt0_vpc0_id" {
  value = huaweicloud_vpc_subnet.snet_pvt0_vpc0.id
}

output "vpc0_eni0_cce_id" {
  value = huaweicloud_vpc_subnet.vpc0_eni0_cce.id
}

output "vpc0_eni1_cce_id" {
  value = huaweicloud_vpc_subnet.vpc0_eni1_cce.id
}

output "vpc0_eni0_cce_ipv4_subnet_id" {
  value = huaweicloud_vpc_subnet.vpc0_eni0_cce.ipv4_subnet_id
}

output "vpc0_eni1_cce_ipv4_subnet_id" {
  value = huaweicloud_vpc_subnet.vpc0_eni1_cce.ipv4_subnet_id
}

output "secgroup_public0_id" {
  value = huaweicloud_networking_secgroup.secgroup_public0.id
}

output "eip_ecs0_vpc0_address" {
  value = huaweicloud_vpc_eip.eip_ecs0_vpc0.address
}
output "eip_ecs0_vpc0_id" {
  value = huaweicloud_vpc_eip.eip_ecs0_vpc0.id
}

output "vpc0_eni_cce_ap0_ipv4_subnet_id" {
  value = huaweicloud_vpc_subnet.vpc0_eni_cce_ap0.ipv4_subnet_id
}

output "snet_pub0_vpc1_id" {
  value = var.enable_vpc_beta ? huaweicloud_vpc_subnet.snet_pub0_vpc1[0].id : ""
}
