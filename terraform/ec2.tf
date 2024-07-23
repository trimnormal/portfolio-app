resource "aws_launch_template" "this" {
  name_prefix   = "zc-portfolio-app-launch-template-"
  image_id      = data.aws_ami.this.id
  instance_type = "t4g.micro"
  instance_market_options {
    market_type = "spot"
  }
} #test4

data "aws_ami" "this" {
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.5.20240722.0-kernel-6.1-arm64"]
  }
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.latest_version
  }
  health_check_grace_period = 300
  health_check_type = "EC2"
}