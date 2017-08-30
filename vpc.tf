
/*
    VPC
*/
resource "aws_vpc" "tf_pruebas" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames="true"
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


/*
  Public Subnet
*/

resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.tf_pruebas.id}"
  cidr_block = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = "true"

  tags {
    Name = "public"
  }
}


resource "aws_route_table" "route-public" {
    vpc_id = "${aws_vpc.tf_pruebas.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.tf_pruebas_gateway.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}


resource "aws_route_table_association" "route-public-association" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.route-public.id}"
}




/*
  Private Subnet
*/


resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.tf_pruebas.id}"
  cidr_block = "${var.private_subnet_cidr}"
  map_public_ip_on_launch = "false"

  tags {
    Name = "private"
  }
}

resource "aws_route_table" "route-private" {
    vpc_id = "${aws_vpc.tf_pruebas.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.proxy.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}


resource "aws_route_table_association" "route-private-association" {
    subnet_id = "${aws_subnet.private.id}"
    route_table_id = "${aws_route_table.route-private.id}"
}


