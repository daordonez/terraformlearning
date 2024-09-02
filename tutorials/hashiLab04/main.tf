# The main.tf file in Terraform is a required configuration file that defines the infrastructure resources that should be created, modified or deleted. This file is used to declare the resources that make up your infrastructure in a declarative way.

resource "aws_vpc" "vpc-lab03" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "vpc-lab03"
  }
}

resource "aws_network_interface" "ni-lab03" {
  subnet_id   = aws_subnet.subnet01-lab03.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary-network-interface-lab03"
  }
}

resource "aws_subnet" "subnet01-lab03" {
  vpc_id            = aws_vpc.vpc-lab03.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "subnet-lab03"
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.ni-lab03.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Name = "hashicorp-tutorials-lab03-demo"
  }
}