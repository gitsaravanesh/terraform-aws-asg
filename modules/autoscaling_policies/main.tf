resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = var.autoscaling_group_name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = var.autoscaling_group_name
}

output "scale_up_policy_arn" {
  value = aws_autoscaling_policy.scale_up.arn
}

output "scale_down_policy_arn" {
  value = aws_autoscaling_policy.scale_down.arn
}
