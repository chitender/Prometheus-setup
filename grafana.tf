# Define webserver inside the public subnet

resource "aws_instance" "grafana" {
   ami  = "${data.aws_ami.centos.id}"
   instance_type = "t2.medium"
   key_name = "devops"
   subnet_id = "${var.private_subnet_id}"
   vpc_security_group_ids = ["${var.private_security_group_id}"]
   associate_public_ip_address = false
   private_ip = "${var.private_ip_grafana}"
   source_dest_check = false
   tags = {
    Name = "Grafana"
    TechnologyUnit =  "Devops"
    Component = "Monitoring"
    Environment = "Prod"
    Owner = "Chitender"
    Project = "Devops"
  }
    root_block_device {
    volume_type           = "gp2"
    volume_size           = 50
    delete_on_termination = false
    }
    ebs_block_device {
    device_name           = "/dev/sdf"
    volume_type           = "gp2"
    volume_size           = 250
    encrypted             = true
  }
   user_data = "${file("install_grafana.sh")}"
   
}
