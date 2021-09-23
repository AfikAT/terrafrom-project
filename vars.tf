variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "ssh_private_key" {
    default = "mykeyproj.pem"
    description = "SSH_Private_Key"
}
variable "ami_id" {
    default = "ami-0c0e8c8bc308182d5"
}

variable "ec2_username" {
    default = "ec2-user"
}

variable "aws_region" {
    default = "eu-west-1"
}
