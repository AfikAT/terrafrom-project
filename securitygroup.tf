resource "aws_security_group" "enable-ssh-flaskapi" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    name = "enable-ssh-flaskapi"
    description = "A security group that allow ssh trafic"

    dynamic "ingress" {
        for_each = local.ports_start
        content{
         description = "Enable ssh and flask api app ports from vpc"
         from_port = ingress.value
         to_port = element(local.ports_end, index(local.ports_start, ingress.value))
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
        }
    }

    tags = {
        Name = "enable-ssh-flaskapi"
    }


    egress {
    
         from_port = 0
         to_port = 0
         protocol = "-1"
         cidr_blocks = ["0.0.0.0/0"]
    }
}
locals {
  ports_start = [22, 5000] #from_port
  ports_end = [22, 5000] #to_port
}
    