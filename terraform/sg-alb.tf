resource "aws_security_group" "ALB" {
  name   = "zc-portfolio-app"
  vpc_id = data.aws_vpcs.this.ids[0]
}

#### RULES ####

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.ALB.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.ALB.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_egress_rule" "ALBtoEc2" {
  security_group_id            = aws_security_group.ALB.id
  from_port                    = 8501
  to_port                      = 8501
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.Ec2.id
}

moved {
  from = aws_security_group.this
  to   = aws_security_group.ALB
}