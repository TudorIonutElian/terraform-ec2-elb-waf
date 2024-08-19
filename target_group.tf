resource "aws_lb_target_group" "demo_iris_target_group" {
   name               = "elb-target-group"
   target_type        = "instance"
   port               = 80
   protocol           = "HTTP"
   vpc_id             = aws_vpc.elb_project.id
   health_check {
      healthy_threshold   = var.health_check["healthy_threshold"]
      interval            = var.health_check["interval"]
      unhealthy_threshold = var.health_check["unhealthy_threshold"]
      timeout             = var.health_check["timeout"]
      path                = var.health_check["path"]
      port                = var.health_check["port"]
  }
}