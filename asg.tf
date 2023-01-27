resource "aws_autoscaling_group" "gladys_asg" {
  vpc_zone_identifier =  var.pub-sub-id
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  target_group_arns   = ["${aws_lb_target_group.my-alb-tg.arn}"]

  launch_template {
    id      = aws_launch_template.gladys_asg.id
    version = "$Latest"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> host-inventory"
  }
  /*
  provisioner "local-exec" {
    command = 
    sudo echo "${self.public_ip}" > /root/Deploy-a-three-teir-Archictecture-using-Terraform-and-Ansible/host-inventory
  }
  */
}
