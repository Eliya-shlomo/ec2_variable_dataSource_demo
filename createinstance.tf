data "aws_availability_zones" "available" {}

data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "my_instance_example" {
  ## region got's from aws_region variable on variable file.
  ami           = data.aws_ami.latest-ubuntu.id
  instance_type = "t3.micro"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "demoInstance"
  }

   vpc_security_group_ids = [var.security_group]
}




