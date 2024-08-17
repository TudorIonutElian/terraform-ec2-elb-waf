resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.elb_project.id

  tags = {
    Name = "elb_project"
  }
}

resource "aws_route_table" "project_rt" {
  vpc_id = aws_vpc.elb_project.id

  tags = {
    Name = "elb_project"
  }
}

resource "aws_route" "project_rt_default" {
  route_table_id         = aws_route_table.project_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.project_igw.id
}