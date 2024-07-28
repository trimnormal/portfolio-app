resource "aws_ecr_repository" "this" {
  name = "zc-portfolio-app"
}

resource "aws_ecs_cluster" "this" {
  name = "zc-portfolio-app"
}

resource "aws_ecs_task_definition" "this" {
  family                   = "zc-portfolio-app"
  requires_compatibilities = ["EC2"]
  container_definitions = jsonencode([
    {
      name      = "zc-portfolio-app"
      image     = "${aws_ecr_repository.this.repository_url}:latest"
      cpu       = 750
      memory    = 750
      essential = true
      portMappings = [
        {
          containerPort = 8501
          hostPort      = 8501
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "AWS_DEFAULT_REGION"
          value = "us-east-1"
        }
      ]

    }
  ])
  execution_role_arn = aws_iam_role.TaskExecutionRole.arn
  task_role_arn      = aws_iam_role.TaskRole.arn
}

resource "aws_ecs_service" "this" {
  name                               = "zc-portfolio-app"
  cluster                            = aws_ecs_cluster.this.id
  task_definition                    = aws_ecs_task_definition.this.arn
  launch_type                        = "EC2"
  desired_count                      = 1
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 100

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = "zc-portfolio-app"
    container_port   = 8501
  }

  depends_on = [aws_lb_listener.HTTP, aws_lb_listener.HTTPS] #not sure if needed
}

resource "aws_ecs_capacity_provider" "this" {
  name = "zc-portfolio-app"
  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.this.arn
  }
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name       = aws_ecs_cluster.this.name
  capacity_providers = [aws_ecs_capacity_provider.this.name]
}