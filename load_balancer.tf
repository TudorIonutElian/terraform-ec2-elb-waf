resource "aws_lb" "elb_load_balancer" {
  name               = "ec2-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ aws_security_group.elb_project_sg.id ]
  subnets            = [ aws_subnet.elb_project_subnet_2.id, aws_subnet.elb_project_subnet_1.id ]

  enable_deletion_protection = true
  
  tags = {
    Name = "elb_project"
  }
}