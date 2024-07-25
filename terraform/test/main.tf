data "aws_vpcs" "this" {
  tags = {
    name = "default"
  }
}

data "aws_subnets" "this" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.this.ids[0]]
  }
  filter {
    name   = "availability-zone"
    values = ["us-east-1e", "us-east-1f"]
  }
}

output "name" {
  value = data.aws_subnets.this
}

output "two" {
    value = data.aws_vpcs.this
  
}