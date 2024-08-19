resource "aws_lb_target_group_attachment" "demo_iris_tg_attachment_test1" {
  target_group_arn = aws_lb_target_group.demo_iris_target_group.arn
  target_id        = aws_instance.demo_alb_waf_ec2_instance_2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "demo_iris_tg_attachment_test2" {
  target_group_arn = aws_lb_target_group.demo_iris_target_group.arn
  target_id        = aws_instance.demo_alb_waf_ec2_instance_1.id
  port             = 80
}