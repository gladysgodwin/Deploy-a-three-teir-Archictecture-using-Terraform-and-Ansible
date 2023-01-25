output "vpc_id" {
  description = "ID of project VPC"
  value       = aws_vpc.love_vpc.id
}
output "my_lb_arn" {
  description = "My Load Balancer arn"
  value       = aws_lb.my-alb[count.index]
  # aws_lb.my-alb.arn
}

output "public-ip" {
  description = "My public ip"
  value       =  aws_autoscaling_group.gladys_asg.*.public_ip
}
