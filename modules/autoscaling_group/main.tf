data "aws_subnet" "example" {
  id = var.subnet_id
}

resource "aws_autoscaling_group" "example" {
  name                 = "example"
  launch_configuration = var.launch_configuration_id
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  desired_capacity     = var.asg_desired_capacity
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

output "autoscaling_group_name" {
  value = aws_autoscaling_group.example.name
}
