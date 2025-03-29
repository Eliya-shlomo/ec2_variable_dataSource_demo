data "aws_availability_zones" "available" {}


## finding the ami details on aws console - AMIs: choose public images - and than got the full details of the ami.
data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


resource "aws_instance" "my_instance_example" {
  ## region got's from aws_region variable on variable file.
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "demoInstance"
  }

   vpc_security_group_ids = [var.security_group]
}




