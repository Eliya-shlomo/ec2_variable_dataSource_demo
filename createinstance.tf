
resource "aws_instance" "my_instance_example" {
  ## ami hard coded, depends on the zone we uploading
  ami           = lookup(var.AMIS, var.aws_region)
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstance"
  }

   vpc_security_group_ids = [var.security_group]

  provisioner "file" {
    source = "installNginx.sh"
    destination = "/tmp/installNginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installNginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/installNginx.sh",
      "sudo /tmp/installNginx.sh"
    ]
  }

  connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "ssh"
    user = var.instance_username
    private_key = file(var.path_to_private_key)
  }


}

resource "aws_key_pair" "my_key" {
  # create pub key on instance for connecting to the machine. 
  key_name = "my_key"
  public_key = file(var.path_to_public_key)
}


