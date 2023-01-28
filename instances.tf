resource "aws_instance" "my-servers" {
    ami             = var.ami
    instance_type   = var.instance_type
    count           = 3
    subnet_id       = "${element(aws_subnet.love-public-subnt.*.id, count.index)}"
    security_groups = aws_security_groups.my_alb_sg.id 
    
    tags {
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

provisioner "local-exec" {
  command = "echo "${aws_instance.my-servers.public_ip}" > /root/Deploy-a-three-teir-Archictecture-using-Terraform-and-Ansible/host-inventory"
}