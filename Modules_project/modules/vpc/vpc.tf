
# creating VPC

resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
    tags = {
    Name = "vpc"
  }
}

# Creating public subnet 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pub_sub1
  availability_zone = var.pub_az1
  tags = {
    Name = "public_subnet_1"
  }
}

# Creating public subnet 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pub_sub2
  availability_zone = var.pub_az2
  tags = {
    Name = "public_subnet_2"
  }
}

# Creating private subnet 1

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pvt_sub1
  availability_zone = var.pvt_az1
  tags = {
    Name = "private_subnet_1"
  }
}

# Creating private subnet 2

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pvt_sub2
  availability_zone = var.pvt_az2
  tags = {
    Name = "private_subnet_2"
  }
}

# Creation of Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

# creation of Elastic IP 1

resource "aws_eip" "myeip1" {
 }

# creation of Elastic IP 2

resource "aws_eip" "myeip2" {
  }

# Creation of NAT Gateway 1

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.myeip1.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "NAT_GW_1"
  }
}
# Creation of NAT Gateway 2

resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.myeip2.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = "NAT_GW_2"
  }
}

# creation of public rt 1

resource "aws_route_table" "public_rt_1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
tags = {
    Name = "public_rt_1"
  }
}

# creation of public rt 2

resource "aws_route_table" "public_rt_2" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
tags = {
    Name = "public_rt_2"
  }
}

# creation of private rt 1

resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_1.id
  }
tags = {
    Name = "private_rt_1"
  }
}

# creation of private rt 2

resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_2.id
  }
tags = {
    Name = "private_rt_2"
  }
}

# route table association

# public_rt_association_1

resource "aws_route_table_association" "public_rt_ass1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt_1.id
}

# public_rt_association_2

resource "aws_route_table_association" "public_rt_ass2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt_2.id
}

# private_rt_association_1

resource "aws_route_table_association" "private_rt_ass1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt_1.id
}

# private_rt_association_2

resource "aws_route_table_association" "private_rt_ass2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt_2.id
}

# Creation of public SG

resource "aws_security_group" "public_sg" {
    vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  tags = {
    Name = "allow_ssh_http"
  }
}

# Creation of private SG

resource "aws_security_group" "private_sg" {
   vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  tags = {
    Name = "allow_mysql"
  }
}