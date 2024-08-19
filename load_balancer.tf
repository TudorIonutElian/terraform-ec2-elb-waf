resource "aws_lb" "elb_load_balancer" {
  name               = "ec2-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ aws_security_group.elb_project_sg.id ]
  subnets            = [ aws_subnet.elb_project_subnet_2.id, aws_subnet.elb_project_subnet_1.id ]

  enable_deletion_protection = true
  enable_cross_zone_load_balancing = true

  tags = {
    Name = "elb_project"
  }
}

resource "aws_lb_listener" "lb_listener_http" {
   load_balancer_arn    = aws_lb.elb_load_balancer.id
   port                 = "80"
   protocol             = "HTTP"
   default_action {
    target_group_arn = aws_lb_target_group.demo_iris_target_group.id
    type             = "forward"
  }
}