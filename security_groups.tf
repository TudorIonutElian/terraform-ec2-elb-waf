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