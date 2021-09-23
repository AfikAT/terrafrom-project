##Main internet vpc 
resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"

  tags = {
      Name = "main-vpc"
  }
}

#Main Public subnet
resource "aws_subnet" "main-subnet" {
   vpc_id = "${aws_vpc.main-vpc.id}"
   cidr_block = "10.0.2.0/24"
   map_public_ip_on_launch = "true"
   availability_zone = "eu-west-1a"

   tags = {
       Name = "main-subnet-1"
   }
}

#Main private subnet
resource "aws_subnet" "main-private-1" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-1a"

    tags = {
        Name = "main-private-1"
    }
}

###Internet Gateway for connecting our public subnet
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main-vpc.id}"

    tags =  {
        Name = "main-gw"
    }
}
#Route table for our instance allowing all traffic
resource "aws_route_table" "main-public-route" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-gw.id
    }

    tags = {
        Name = "main-public-route"
    }
}
#Route table association for our main subnet
resource "aws_route_table_association" "main-public-association" {
    subnet_id = aws_subnet.main-subnet.id
    route_table_id = aws_route_table.main-public-route.id
}
