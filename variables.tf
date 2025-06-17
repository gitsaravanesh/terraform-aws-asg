variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-2"
}

variable "instance_type" {
  description = "The instance type for the Launch Configuration"
  type        = string
  default     = "t2.micro"
}

variable "image_id" {
  description = "The AMI ID for the Launch Configuration"
  type        = string
  default     = "ami-010876b9ddd38475e"
}

variable "key_name" {
  description = "The key name for the Launch Configuration"
  type        = string
  default     = "Prac-Key"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch instances in"
  type        = string
  default     = "subnet-0474d85fe79ef1f5d"
}

variable "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = number
  default     = 4
}

variable "asg_desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "scale_up_threshold" {
  description = "CPU utilization threshold to scale up"
  type        = number
  default     = 50
}

variable "scale_down_threshold" {
  description = "CPU utilization threshold to scale down"
  type        = number
  default     = 50
}
