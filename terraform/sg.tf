resource "aws_security_group" "this" {
  name   = "zc-portfolio-app"
  vpc_id = data.aws_vpcs.this.ids[0]
}