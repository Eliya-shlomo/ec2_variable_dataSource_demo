# ## create aws vpc

# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.0.0.0/16"
#   instance_tenancy = "default"
#   enable_dns_support = "true"
#   enable_dns_hostnames = "true"

#   tags = {
#     Name = "my_vpc"
#   }
# }

# ## Puclic subnets in custom VPC 
# resource "aws_subnet" "my_public-1" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.1.0/24"
#   map_customer_owned_ip_on_launch = "true"
#   availability_zone = "us-east-sa"

#   tags = {
#     Name = "my_public-1"
#   }
# }

# resource "aws_subnet" "my_public-2" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.2.0/24"
#   map_customer_owned_ip_on_launch = "true"
#   availability_zone = "us-east-sb"

#   tags = {
#     Name = "my_public-2"
#   }
# }

# resource "aws_subnet" "my_public-3" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.3.0/24"
#   map_customer_owned_ip_on_launch = "true"
#   availability_zone = "us-east-sc"

#   tags = {
#     Name = "my_public-3"
#   }
# }

# ## Private subnets in custom VPC 
# resource "aws_subnet" "my_private-1" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.4.0/24"
#   map_customer_owned_ip_on_launch = "true"
#   availability_zone = "us-east-sa"

#   tags = {
#     Name = "my_private-1"
#   }
# }

# resource "aws_subnet" "my_private-2" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.5.0/24"
#   map_customer_owned_ip_on_launch = "true"
#   availability_zone = "us-east-sb"

#   tags = {
#     Name = "my_private-2"
#   }
# }

# resource "aws_subnet" "my_private-3" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.6.0/24"
#   map_customer_owned_ip_on_launch = "true"
#   availability_zone = "us-east-sc"

#   tags = {
#     Name = "my_private-3"
#   }
# }


# ## Custom internet Gateway

# resource "aws_internet_gateway" "my_gateway" {
#   vpc_id = aws_vpc.my_vpc.id

#   tags = {
#     Name = "my_igw"
#   }
# }

# ## Routing Table for the custom VPC 
# resource "aws_route_table" "my-public" {
#   vpc_id = aws_vpc.my_vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.my_gateway.id
#   }

#   tags = {
#     Name = "My_RT"
#   }
# }

# resource "aws_route_table_association" "my-public-1-a" {
#   subnet_id = aws_subnet.my_public-1.id
#   route_table_id = aws_route_table.my-public.id
# }

# resource "aws_route_table_association" "my-public-2-a" {
#   subnet_id = aws_subnet.my_public-2.id
#   route_table_id = aws_route_table.my-public.id
# }

# resource "aws_route_table_association" "my-public-3-a" {
#   subnet_id = aws_subnet.my_public-3.id
#   route_table_id = aws_route_table.my-public.id
# }


