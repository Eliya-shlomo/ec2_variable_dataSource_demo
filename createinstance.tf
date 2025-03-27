resource "aws_instance" "my_instance_example" {
  ## ami hard coded, depends on the zone we uploading
  ami           = lookup(var.AMIS, var.aws_region)
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstance"
  }

  security_groups = "${var.security_group}"
}

