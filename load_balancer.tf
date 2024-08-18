resource "aws_lb" "elb_load_balancer" {
  name               = "ec2-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_project_sg.id]
  subnets            = [aws_subnet.elb_project_subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.elb_project_s3bucket.id
    prefix  = "elb-load-balancer"
    enabled = true
  }

  tags = {
    Name = "elb_project"
  }
}