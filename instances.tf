resource "aws_instance" "my-servers" {
    ami             = var.ami
    instance_type   = var.instance_type
    count           = 3
    subnet_id       = "${element(aws_subnet.love-public-subnt.*.id, count.index)}"
    security_groups = "${aws_security_group.my_alb_sg.id}"
    
    tags = {
        Name = "love"
    }

    depends_on = [
aws_key_pair.mykeypair
]
}
resource "tls_private_key" "privkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "mykeypair" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.privkey.public_key_openssh}"
}

resource "local_file" "myhosts" {
    count = 3

    filename = var.filepath
    content  = <<EOT
    "${aws_instance.my-servers[count.index].public_ip}"
    EOT
}