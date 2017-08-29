
/*
    VPC
*/
resource "aws_vpc" "tf_pruebas" {
  cidr_block = "${var.vpc_cidr}"
  tags {
    Name = "tf_pruebas"
  }
}


resource "aws_internet_gateway" "tf_pruebas_gateway" {
    vpc_id = "${aws_vpc.tf_pruebas.id}"
}


/*
  SUBNETS

*/


resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.tf_pruebas.id}"
  cidr_block = "${public_subnet_cidr}"
  tags {
    Name = "public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.tf_pruebas.id}"
  cidr_block = "${private_subnet_cidr}"

  tags {
    Name = "private"
  }
}

/*

  SECURITY GROUPS

*/
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


/*
  INSTANCES

*/