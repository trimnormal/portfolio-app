resource "aws_launch_template" "this" {
  name_prefix = "zc-portfolio-app-launch-template-"
  iam_instance_profile {
    arn = aws_iam_instance_profile.Ec2.arn
  }
  image_id      = "ami-047fb6d800866b9fe" #Amazon Linux 2 AMI (HVM) - Kernel 5.10 Arm
  instance_type = "t4g.micro"
  instance_market_options {
    market_type = "spot"
  }
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=zc-portfolio-app >> /etc/ecs/ecs.config"
  security_group_names = [aws_security_group.this.name]
}

resource "aws_autoscaling_group" "this" {
  availability_zones = ["us-east-1e", "us-east-1f"]
  name_prefix        = "zc-portfolio-app-asg-"
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.latest_version
  }
  health_check_grace_period = 300
  health_check_type         = "EC2"
}