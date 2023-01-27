# Provisioner for applying Ansible playbook
/*
provisioner “remote-exec” {
  connection {
  user = “ec2-user”
  private_key = “${file('/root/.ssh/mykey.pem')}”
  }
}
inline = [
amazon-linux-extras install epel yum install ansible git -y,
]
*/

provisioner “local-exec” {
  command = sudo echo "${self.public_ip}" > /root/Deploy-a-three-teir-Archictecture-using-Terraform-and-Ansible/host-inventory
}
/*
provisioner “local-exec” {
  command = “sudo ansible-playbook -i host-inventory –private-key=/root/.ssh/mykey.pem main.yml”,
}
*/
