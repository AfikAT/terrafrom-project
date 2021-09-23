resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykeyproj.key_name
    subnet_id = aws_subnet.main-subnet.id
    vpc_security_group_ids = [aws_security_group.enable-ssh-flaskapi.id]

 provisioner  "file" {
    source = "ansible-scripts/flask-app"
    destination = "/tmp/flask-app"
}

 provisioner "local-exec" {
     working_dir = "${path.module}/ansible-scripts/"
     interpreter = ["/bin/bash", "-c"]
     command ="chmod +x ./ansible_provision.sh;./ansible_provision.sh"
     environment = {
         public_ip = "${self.public_ip}"
     }
}
  connection {
  type = "ssh"
  user = "ubuntu"
  host = "${self.public_ip}"
  private_key = file("${path.module}/.ssh/${var.ssh_private_key}")
  }
}