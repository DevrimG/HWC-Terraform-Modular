
locals {
  fg_blender_app_name = "fg-blender-app-${var.name}"
}

resource "huaweicloud_fgs_function" "fg_blender_app" {
  count                 = var.enable_function_blender ? 1 : 0
  name                  = local.fg_blender_app_name
  enterprise_project_id = var.enterprise_project_id
  app                   = "default"

  timeout          = 6000
  max_instance_num = 1

  memory_size = 32768
  gpu_memory  = 24576
  gpu_type    = "L2"

  functiongraph_version = "v2"
  runtime               = "http"
  custom_image {
    url = var.fg-blender-app
  }

  handler = "-"
  agency  = "fgs_default_agency"

}
