resource "aws_vpc" "acme-vpc" {
    cidr_block = "10.0.0.0/16"
    tags {
        Name = "Acme VPC"
    }
}

resource "aws_internet_gateway" "acme-ig" {
    vpc_id = "${aws_vpc.acme-vpc.id}"
    tags {
        Name = "Acme Internet Gateway"
    }
}