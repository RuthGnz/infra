
# Create the services

resource "aws_instance" "gitlab" {
    ami           = "ami-785db401"
    instance_type = "t2.micro"
    key_name="${var.key_name}"
    vpc_security_group_ids = ["${aws_security_group.private.id}"]
    subnet_id = "${aws_subnet.private.id}"

    tags {
      Name = "gitlab"
    }
}



resource "aws_instance" "jenkins" {
    ami           = "ami-785db401"
    instance_type = "t2.micro"
    key_name="${var.key_name}"
    vpc_security_group_ids = ["${aws_security_group.private.id}"]
    subnet_id = "${aws_subnet.private.id}"

    tags {
      Name = "jenkins"
    }
}

resource "aws_security_group" "private" {
  name        = "private"
  vpc_id ="aws_vpc.tf_pruebas.id"

   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.proxy_ip}/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.proxy_ip}/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.proxy_ip}/32"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["${var.proxy_ip}/32"]

  }
}


