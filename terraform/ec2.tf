resource "aws_launch_template" "this" {
  name_prefix = "zc-portfolio-app-launch-template-"
  iam_instance_profile {
    arn = aws_iam_instance_profile.Ec2.arn
  }
  image_id      = "ami-078b975e9370a6516"
  instance_type = "t3.micro"
  instance_market_options {
    market_type = "spot"
  }
  user_data            = base64encode("#!/bin/bash\necho ECS_CLUSTER=zc-portfolio-app >> /etc/ecs/ecs.config")
  security_group_names = [aws_security_group.Ec2.name]
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
  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}