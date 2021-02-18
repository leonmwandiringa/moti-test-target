
resource "aws_security_group" "ps_jenkins_sg" {
  name        = "ps_jenkins-security-group"
  description = "Allow HTTP, HTTPS and SSH traffic"

  dynamic "ingress" {
    for_each = var.instance_sg_rules_ingress
    content {
        description = ingress.value.description
        from_port   = ingress.value.from_port
        to_port     = ingress.value.to_port
        protocol    = ingress.value.protocol
        cidr_blocks = [ingress.value.cidr_blocks]
    }
  }

  dynamic "egress" {
    for_each = var.instance_sg_rules_egress
    content {
        from_port   = egress.value.from_port
        to_port     = egress.value.to_port
        protocol    = egress.value.protocol
        cidr_blocks = [egress.value.cidr_blocks]
    }
  }

  tags = merge(
    var.global_tags,
    {
      "Name" = "ps_jenkins_sg"
    },
  )
}