provider "aws" {
  region = "ap-northeast-2"
}

# Create a Launch Configuration
resource "aws_launch_configuration" "example" {
  name_prefix                 = "example-lc-"
  instance_type                 = "t2.micro"
  image_id                      = "ami-0f8aef1783704ebc9"
  key_name                      = "Key-3"
  # Specify the subnet IDs where the launch configuration can launch instances
  associate_public_ip_address  = true
}

data "aws_subnet" "example" {
  id = "subnet-0abf54ffe836d8608"
}

resource "aws_autoscaling_group" "example" {
  name                 = "example"
  launch_configuration = aws_launch_configuration.example.id
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = [data.aws_subnet.example.id]

  tag {
    key                 = "Name"
    value               = "example"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name = "scale-up"
  policy_type = "SimpleScaling"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.example.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name = "scale-down"
  policy_type = "SimpleScaling"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.example.name
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = "EC2MAX"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "This metric monitors the CPU utilization of EC2 instances in the example Auto Scaling group"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]

  dimensions = {
    AutoScalingGroupName = "example"
  }
}


resource "aws_cloudwatch_metric_alarm" "min" {
  alarm_name          = "EC2MIN"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "50"
  alarm_description   = "Scale down if desired capacity is less than or equal to 50."
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
  
  dimensions = {
    AutoScalingGroupName = "example"
  }
}
