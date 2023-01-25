resource "aws_route53_zone" "my_hosted_zone" {
  name = var.domain
}

resource "aws_route53_record" "terraform-test" {  
  zone_id = aws_route53_zone.my_hosted_zone.zone_id
  name    = var.a-record
  type    = "A"

  alias {
    name                   = aws_lb.my-alb.dns_name
    zone_id                = aws_lb.my-alb.zone_id
    evaluate_target_health = true
  }
}
