/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "cloudwatch_ec2_instances" {
  ami           = data.aws_ami.latest_al_2023_ami
  instance_type = "t2.micro"
  user_data     = file("scripts/entry.sh")

  count = 2

  tags = {
    Name = "elb_project"
  }
}