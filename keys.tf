resource "tls_private_key" "mykeyproj" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}
resource "aws_key_pair" "mykeyproj" {
    key_name = "mykeyproj" #Will generate a public key for ec2 instance
    public_key = tls_private_key.mykeyproj.public_key_openssh

 provisioner "local-exec" {
   command = "echo \"${tls_private_key.mykeyproj.private_key_pem}\" > .ssh/\"${var.ssh_private_key}\"; chmod 400 .ssh/\"${var.ssh_private_key}\""
 }
}
