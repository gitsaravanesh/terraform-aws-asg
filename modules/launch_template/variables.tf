variable "instance_type" {
  description = "The instance type for the Launch Configuration"
  type        = string
}

variable "image_id" {
  description = "The AMI ID for the Launch Configuration"
  type        = string
}

variable "key_name" {
  description = "The key name for the Launch Configuration"
  type        = string
}
