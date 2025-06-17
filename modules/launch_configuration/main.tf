resource "aws_launch_template" "example" {
  name_prefix   = "example-lt-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    device_index                = 0
  }
}

output "launch_template_id" {
  value = aws_launch_template.example.id
}

output "launch_template_version" {
  value = aws_launch_template.example.latest_version
}
