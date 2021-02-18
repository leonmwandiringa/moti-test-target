
resource "aws_instance" "ps_jenkins_instance" {
  key_name      = var.instance_keys
  ami           = var.instance_ami
  instance_type = var.instance_type
  # security_groups = [aws_security_group.ps_jenkins_sg.id]

  root_block_device {
      volume_size = "20"
      volume_type = "gp2"
  }
  user_data = var.user_data

  tags = merge(
    var.global_tags,
    {
      "Name" = "ps jenkins runner"
    },
  )

  depends_on = [
    aws_security_group.ps_jenkins_sg,
  ]

}

output "instance_ip_addr" {
  value = aws_instance.ps_jenkins_instance.public_ip
}