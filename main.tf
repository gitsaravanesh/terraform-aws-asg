provider "aws" {
  region = var.region
}

module "launch_configuration" {
  source         = "./modules/launch_configuration"
  instance_type  = var.instance_type
  image_id       = var.image_id
  key_name       = var.key_name
}

module "autoscaling_group" {
  source                 = "./modules/autoscaling_group"
  subnet_id              = var.subnet_id
  launch_configuration_id = module.launch_configuration.launch_configuration_id
  asg_min_size           = var.asg_min_size
  asg_max_size           = var.asg_max_size
  asg_desired_capacity   = var.asg_desired_capacity
}

module "autoscaling_policies" {
  source                   = "./modules/autoscaling_policies"
  autoscaling_group_name   = module.autoscaling_group.autoscaling_group_name
}

module "cloudwatch_alarms" {
  source                    = "./modules/cloudwatch_alarms"
  autoscaling_group_name    = module.autoscaling_group.autoscaling_group_name
  scale_up_policy_arn       = module.autoscaling_policies.scale_up_policy_arn
  scale_down_policy_arn     = module.autoscaling_policies.scale_down_policy_arn
  scale_up_threshold        = var.scale_up_threshold
  scale_down_threshold      = var.scale_down_threshold
}
