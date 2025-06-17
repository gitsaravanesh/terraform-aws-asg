variable "subnet_id" {
  description = "The ID of the subnet to launch instances in"
  type        = string
}

variable "launch_template_id" {
  description = "The ID of the Launch Configuration"
  type        = string
}

variable "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = number
}

variable "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group"
  type        = number
}
