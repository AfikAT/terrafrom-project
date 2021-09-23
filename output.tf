output "Flask_Application" {
    value = "http://${aws_instance.ec2_instance.public_dns}:5000"
    description = "Flask Application"
}