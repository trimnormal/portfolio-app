#### Task Role ####
resource "aws_iam_role" "TaskRole" {
  name               = "zc-portfolio-app-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.EcsAssumeRolePolicy.json
}

resource "aws_iam_role_policy_attachment" "Dynamo" {
  role       = aws_iam_role.TaskRole.name
  policy_arn = aws_iam_policy.Dynamo.arn
}

resource "aws_iam_role_policy_attachment" "SNS" {
  role       = aws_iam_role.TaskRole.name
  policy_arn = aws_iam_policy.SNS.arn
}

#### Task Execution Role ####
resource "aws_iam_role" "TaskExecutionRole" {
  name               = "zc-portfolio-app-ecs-task-exec-role"
  assume_role_policy = data.aws_iam_policy_document.EcsAssumeRolePolicy.json
}

resource "aws_iam_role_policy_attachment" "TaskExecutionRole" {
  role = aws_iam_role.TaskExecutionRole.name

  #This policy could probably be cut donw a little
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "EcsAssumeRolePolicy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

#### EC2 Instance Profile ####
resource "aws_iam_instance_profile" "Ec2" {
  name = "zc-portfolio-app-instance-profile"
  role = aws_iam_role.Ec2.name
}

resource "aws_iam_role_policy_attachment" "Ec2" {
  role       = aws_iam_role.Ec2.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role" "Ec2" {
  name               = "zc-portfolio-app-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.Ec2.json
}

data "aws_iam_policy_document" "Ec2" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "Dynamo" {
  name        = "DDBVisitCounterAccess"
  description = "Policy to allow access to DynamoDB VisitCounter table"
  policy      = data.aws_iam_policy_document.Dynamo.json
}

data "aws_iam_policy_document" "Dynamo" {
  statement {
    effect = "Allow"
    actions = ["dynamodb:GetItem",
    "dynamodb:UpdateItem"]
    resources = [aws_dynamodb_table.visit_counter.arn]
  }
}

resource "aws_iam_policy" "SNS" {
  name        = "SNSPublishPortfolioApp"
  description = "Allows publish to sns topic for portfolio app"
  policy      = data.aws_iam_policy_document.SNS.json
}

data "aws_iam_policy_document" "SNS" {
  statement {
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = ["arn:aws:sns:us-east-1:953170553831:zc-portfolio-app-topic"]
  }
}