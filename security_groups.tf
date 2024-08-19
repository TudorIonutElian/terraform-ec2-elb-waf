resource "aws_security_group" "elb_project_sg" {
  name        = "elb_project_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.elb_project.id

  tags = {
    Name = "elb_project"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv_443" {
  security_group_id = aws_security_group.elb_project_sg.id
  cidr_ipv4         = aws_vpc.elb_project.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

  tags = {
    Name = "elb_project"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv_80" {
  security_group_id = aws_security_group.elb_project_sg.id
  cidr_ipv4         = aws_vpc.elb_project.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "elb_project"
  }
}

resource "aws_lb_target_group" "load_balancer_target_group" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.elb_project.id
}


resource "aws_lb_target_group_attachment" "first_instance" {
  target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  target_id        = aws_instance.demo_alb_waf_ec2_instance[0].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "second_instance" {
  target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  target_id        = aws_instance.demo_alb_waf_ec2_instance[1].id
  port             = 80
}