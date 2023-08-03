resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags ={
    Name = "my-vpc"
  }


}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"



}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2b"


}


resource "aws_subnet" "public3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2c"


}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-2a"

}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "us-east-2b"


}


resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.103.0/24"
  availability_zone = "us-east-2c"


}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public-route"
  }


}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.r.id
}
resource "aws_eip" "elastic-ip" {

}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.public1.id


}
resource "aws_route_table" "r-p" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id

  }
  tags = {
    Name = "private-route"
  }

}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.r-p.id
}

resource "aws_route_table_association" "e" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.r-p.id
}

resource "aws_route_table_association" "f" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.r-p.id
}

