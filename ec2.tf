/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "demo_alb_waf_ec2_instance_1" {
  ami           = data.aws_ami.ec2_ami_filter.id
  instance_type = "t2.micro"
  user_data     = file("scripts/entry.sh")

  tags = {
    Name = "elb_project"
  }
}

/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "demo_alb_waf_ec2_instance_2" {
  ami           = data.aws_ami.ec2_ami_filter.id
  instance_type = "t2.micro"
  user_data     = file("scripts/entry.sh")

  tags = {
    Name = "elb_project"
  }
}