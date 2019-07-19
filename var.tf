data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true
  filter {
      name   = "name"
      values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }
}

variable "region" {
  description = "region"
  type        = string
  default     = "ap-south-1"
}
variable "vpc_id" {
    description = "Vpc Id in which we need to launch Compute Env"
    type        = string
    default     = "vpc-0f8b9d01b7339620c"
}
variable "private_security_group_id" {
    description = "security group Id for application services"
    type        = string
    default     = "sg-070c9aab818b9e36c"
}
variable "public_security_group_id" {
    description = "security group Id for nginx Server"
    type        = string
    default     = "sg-059335b501851ab7a"
}
variable "private_subnet_id" {
    description = "subnet Id in which we need to launch application server"
    type        = string
    default     = "subnet-014b0c64799304dc2"
}

variable "public_subnet_id" {
    description = "subnet Id in which we need to launch Nginx server"
    type	 = string
    default	 = "subnet-0d7a18da10322b14b"
}

variable "private_ip_nginx" {
    description = "security group Id for application services"
    type        = string
    default     = "PRIVATE_IP_NGINX"
}

variable "private_ip_grafana" {
    description = "security group Id for application services"
    type        = string
    default     = "PRIVATE_IP_GRAFANA"
}

variable "private_ip_prometheus" {
    description = "security group Id for application services"
    type        = string
    default     = "PRIVATE_IP_PROMETHEUS"
}
