resource "aws_vpc" "elb_project" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "elb_project"
  }
}

resource "aws_subnet" "elb_project_subnet_1" {
  vpc_id     = aws_vpc.elb_project.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "elb_project"
  }
}

resource "aws_subnet" "elb_project_subnet_2" {
  vpc_id     = aws_vpc.elb_project.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "elb_project"
  }
}