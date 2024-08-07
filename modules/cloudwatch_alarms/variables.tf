variable "autoscaling_group_name" {
  description = "The name of the Auto Scaling Group"
  type        = string
}

variable "scale_up_policy_arn" {
  description = "The ARN of the scale-up policy"
  type        = string
}

variable "scale_down_policy_arn" {
  description = "The ARN of the scale-down policy"
  type        = string
}

variable "scale_up_threshold" {
  description = "CPU utilization threshold to scale up"
  type        = number
}

variable "scale_down_threshold" {
  description = "CPU utilization threshold to scale down"
  type        = number
}
