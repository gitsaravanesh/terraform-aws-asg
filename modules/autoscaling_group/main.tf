data "aws_subnet" "example" {
  id = var.subnet_id
}

resource "aws_autoscaling_group" "example" {
  name                 = "example"
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  desired_capacity     = var.asg_desired_capacity
  vpc_zone_identifier  = [data.aws_subnet.example.id]

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

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
