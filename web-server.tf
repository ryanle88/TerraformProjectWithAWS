resource "aws_instance" "acme-web-server-1" {
    ami = "ami-04169656fea786776"
    instance_type = "t2.micro"
    associate_public_ip_address = "true"
    subnet_id = "${aws_subnet.acme-public.id}"
    security_groups = ["${aws_security_group.FrontEnd.id}"]
    key_name = "${aws_key_pair.acme-key.key_name}"
    # provisioner "remote-exec" {
    # inline = [
    #   "apt-get update",
    #   "apt-get upgrade -y",
    # ]
    # }
    tags {
        Name = "Acme Web Server Instance"
    }
}

resource "aws_instance" "database" {
    ami = "ami-04169656fea786776"
    instance_type = "t2.micro"
    associate_public_ip_address = "false"
    subnet_id = "${aws_subnet.acme-private.id}"
    security_groups = ["${aws_security_group.Database.id}"]
    key_name = "${aws_key_pair.acme-key.key_name}"
    tags {
        Name = "Database"
    }
}
