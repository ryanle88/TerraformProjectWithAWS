output "acme-web-server-1.ip" {
    value = "${aws_instance.acme-web-server-1.public_ip}"
}

output "acme-web-server-1.private-ip" {
    value = "${aws_instance.acme-web-server-1.private_ip}"
}