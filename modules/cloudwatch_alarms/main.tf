resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_name          = "EC2MAX"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.scale_up_threshold
  alarm_description   = "This metric monitors the CPU utilization of EC2 instances in the example Auto Scaling group"
  alarm_actions       = [var.scale_up_policy_arn]

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }
}

resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_name          = "EC2MIN"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.scale_down_threshold
  alarm_description   = "Scale down if desired capacity is less than or equal to 50."
  alarm_actions       = [var.scale_down_policy_arn]

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }
}
