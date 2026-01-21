
resource "huaweicloud_obs_bucket" "bucket" {
  count                 = var.enable_obs_bucket ? 1 : 0
  bucket                = "${var.bucket_name}-${var.name}"
  acl                   = "private"
  enterprise_project_id = var.enterprise_project_id

  versioning = true

  lifecycle_rule {
    name    = "expire-old-versions"
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }

  tags = {
    Owner = var.name
  }
}
