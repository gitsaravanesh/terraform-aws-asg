resource "aws_launch_configuration" "example" {
  name_prefix                 = "example-lc-"
  instance_type               = var.instance_type
  image_id                    = var.image_id
  key_name                    = var.key_name
  associate_public_ip_address = true
}

output "launch_configuration_id" {
  value = aws_launch_configuration.example.id
}
