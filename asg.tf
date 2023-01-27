resource "aws_autoscaling_group" "gladys_asg" {
  vpc_zone_identifier =  var.pub-sub-id
  desired_capacity    = 0
  max_size            = 0
  min_size            = 0
  target_group_arns   = ["${aws_lb_target_group.my-alb-tg.arn}"]
   
  launch_template {
    id      = aws_launch_template.gladys_asg.id
    version = "$Latest"
  }
   /*
  resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  count = 5
  vpc_security_group_ids = v
 
  provisioner "local-exec" {
    command = 
    sudo echo "${self.public_ip}" > /root/Deploy-a-three-teir-Archictecture-using-Terraform-and-Ansible/host-inventory
  }
  */
}
