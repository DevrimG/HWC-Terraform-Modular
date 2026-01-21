
variable "name" {
  description = "Project name"
  type        = string
}

variable "enterprise_project_id" {
  description = "Enterprise Project ID"
  type        = string
  default     = "0"
}

variable "enable_obs_bucket" {
  description = "Enable OBS Bucket creation"
  type        = bool
  default     = false
}

variable "bucket_name" {
  description = "Name of the OBS bucket"
  type        = string
  default     = "my-bucket"
}
