
# Create the proxy
resource "aws_instance" "proxy" {
    ami           = "ami-785db401"
    instance_type = "t2.micro"
    key_name="${var.key_name}"
    vpc_security_group_ids = ["${aws_security_group.public.id}"]
    private_ip="${var.proxy_ip}"
    tags {
      Name = "Proxy"
    }
}


resource "aws_security_group" "public" {
  name        = "public rules"

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

  ingress {
    from_port   = 443
    to_port     = 443
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


