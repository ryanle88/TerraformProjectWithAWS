resource "aws_key_pair" "acme-key" {
    key_name = "acme-key"
    public_key = "${file("./ssh/insecure-key.pub")}"
}