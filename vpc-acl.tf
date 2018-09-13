resource "aws_network_acl" "acme-acl" {
    vpc_id = "${aws_vpc.acme-vpc.id}"
    tags {
        Name = "Acme Network ACL"
    }
}

resource "aws_network_acl_rule" "acme-acl-rule" {
    network_acl_id = "${aws_network_acl.acme-acl.id}"
    rule_number = 100
    egress = false
    protocol = "-1"
    rule_action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 65535
}
