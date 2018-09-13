resource "aws_subnet" "acme-public" {
    vpc_id = "${aws_vpc.acme-vpc.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags {
        Name = "Acme Public Subnet"
    }
}