

# Configure the AWS Provider
variable "ACCESS_KEY" {}
variable "SECRET_KEY" {}

#Instance
variable "key_name" {
	description="key name for access the instance"
	default="rgonzalez-aws"
}

#Network
variable "proxy_ip"{
	description="Proxy IP"
	default="10.0.0.2"
}
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}