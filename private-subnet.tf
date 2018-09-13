resource "aws_subnet" "acme-private" {
    vpc_id = "${aws_vpc.acme-vpc.id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags {
        Name = "Acme Private Subnet"
    }
}