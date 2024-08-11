resource "aws_security_group" "Ec2" {
  name   = "zc-portfolio-app-ec2"
  vpc_id = data.aws_vpcs.this.ids[0]
}

#### RULES ####

resource "aws_vpc_security_group_ingress_rule" "ALBtoEc2" {
  security_group_id            = aws_security_group.Ec2.id
  from_port                    = 8501
  to_port                      = 8501
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.ALB.id
}

resource "aws_vpc_security_group_egress_rule" "AnyOut" {
  security_group_id = aws_security_group.Ec2.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}