## security Group for my_vpc
resource "aws_security_group" "allow-me-ssh" {
  vpc_id = aws_vpc.my_vpc.id
  name = "allow-my_vpc-ssh"
  description = "security group that allow ssh allocation"

  egress  = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = ["0.0.0.0/0"]
  }

  ingress = {
    from_port = 22
    to_port = 22
    protocol = tcp
    cidr_block = ["0.0.0.0/0"]
  }

  tags = {
      Name = "allow-my_vpc-ssh"
    }
}