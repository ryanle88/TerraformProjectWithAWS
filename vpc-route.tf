
resource "aws_eip" "forNat" {
    vpc = true
}

resource "aws_nat_gateway" "PublicAZ" {
    allocation_id = "${aws_eip.forNat.id}"
    subnet_id = "${aws_subnet.acme-public.id}"
    depends_on = ["aws_internet_gateway.acme-ig"]
}

resource "aws_route_table" "acme-rt-public" {
    vpc_id = "${aws_vpc.acme-vpc.id}"
    tags {
        Name = "Public"
    }
}

resource "aws_route" "acme-r-public-to-internet" {
    route_table_id = "${aws_route_table.acme-rt-public.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.acme-ig.id}"
}

resource "aws_route_table_association" "public" {
    subnet_id = "${aws_subnet.acme-public.id}"
    route_table_id = "${aws_route_table.acme-rt-public.id}"
}

resource "aws_route_table" "acme-rt-private" {
    vpc_id = "${aws_vpc.acme-vpc.id}"
    tags {
        Name = "Private"
    }
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.PublicAZ.id}"
    }
}

resource "aws_route_table_association" "private" {
    subnet_id = "${aws_subnet.acme-private.id}"
    route_table_id = "${aws_route_table.acme-rt-private.id}"
}


