# Terraform project
![Terraform project](https://user-images.githubusercontent.com/52320907/135708635-b58bd53c-0730-4de7-bdbe-df3dca0c6bd6.jpg)
 ## About this proejct:
 * This project will spinning up an instance on aws
 * Provisioing using ansible and deploy our simple flask api app.
 ## Preconfiguration before running this project:
 * <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli">Installing terraform</a>
 * open an aws free tier account if you dont already have.
 * Create IAM admin user
 ## Create an IAM admin user:
 * Log in with your aws account.
 * Go to services --> IAM.
 * Click on add user, write a name for your user.
 * Under Accsess type section, choose programmatic access.
 * In groups tab, click create a group and write a name for your new group.
 * After you creates your new group, attach the administrator group policy role to your group.
 * Click create user for creating your new user and group.
 * You will see at the end your created user and an accsess key and secret key for login.
 * Download the project to your machine and create a new file "terraform.tfvars" with your accsess key and secret key:
   ```
    aws_access_key = "YOUR ACCESS KEY HER"
    aws_secret_key = "YOUR SECRET KEY HERE"
   ```
 * Make sure you are in the current region(in aws console at the right corner)
 * If your region is diferrent from the project region("eu-west-1"),
   you can change it under var.tf, "aws_region" var:
```
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
    default = "CHANGE YOUR REGION HERE"
}
```

   
