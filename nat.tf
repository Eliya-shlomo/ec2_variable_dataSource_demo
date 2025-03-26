## Define External IP
resource "aws_eip" "my_nat" {
  vpc = true
}

resource "aws_nat_gateway" "my-nat-gw" {
  allocation_id = aws_eip.my_nat.id
  subnet_id = aws_subnet.my_public-1.id
  depends_on = [ aws_internet_gateway.my_gateway ]
}


resource "aws_route_table" "my-private" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gw.id
  }

  tags = {
    Name = "my-private"
  }
}

resource "aws_route_table_association" "my-private-1-a" {
  subnet_id = aws_subnet.my_private-1.id
  route_table_id = aws_route_table.my-private.id
}

resource "aws_route_table_association" "my-private-2-a" {
  subnet_id = aws_subnet.my_private-2.id
  route_table_id = aws_route_table.my-private.id
}

resource "aws_route_table_association" "my-private-3-a" {
  subnet_id = aws_subnet.my_private-2.id
  route_table_id = aws_route_table.my-private.id
}

