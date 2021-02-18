
///////// Global ///////
variable "global_tags" {
  description = "All Cloud network global tags for ps"
  type = map(string)
  default = {
    "Author" = "Leon Mwandiringa",
    "Environment" = "Development",
    "Project" = "Testosterone"
  }
}

////////// VPC CONFIG ///////
variable "aws_region" {
    default = "us-east-2"
}
variable "aws_azs" {
  description = "comma separated string of availability zones in order of precedence"
  default     = "us-east-2a, us-east-2b"
}


variable "jenkins_sg_rules_ingress" {
  description = "List of maps of default seurity group rules ingress"
  type        = list(map(string))

  default = [
    {
      description = "HTTP"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "HTTP"
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

variable "jenkins_sg_rules_egress" {
  description = "List of maps of default seurity group rules egress"
  type        = list(map(string))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

///// state lock and distributed state config ///
variable "bucket_backend_state_name" {
    default = "ps-provision"
}
variable "dynamo_db_name" {
  default = "ps-tflocks"
}
variable "dynamo_db_read_capacity" {
  default = 2
}
variable "dynamo_db_write_capacity" {
  default = 2
}
variable "ps_state_key" {
    default = "terraform_dev.tfstate"
}
variable "jenkins_instance_ami" {
    default = "ami-0a91cd140a1fc148a" 
}
variable "jenkins_instance_type" {
    default = "t3.medium" 
}
variable "jenkins_instance_keys" {
    default = "techadon_keys" 
}
variable "jenkins_private_ip" {
    default = "10.0.4.5"
}
variable "jenkins_user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = null
}
