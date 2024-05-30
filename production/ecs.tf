data "aws_iam_policy_document" "ecs_task_execution_role" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "ecs-staging-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

### Policy-ECS ###
resource "aws_iam_role_policy_attachment" "AmazonECS_FullAccess" {
  role = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

### Policy-S3 ###
resource "aws_iam_role_policy_attachment" "AmazonS3FullAccess" {
  role = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

### Policy - cloudwatch_logs ###
resource "aws_iam_role_policy_attachment" "CloudWatchLogsFullAccess" {
  role = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_role_policy_attachment" "CloudWatchReadOnlyAccess" {
  role = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}


resource "aws_ecs_task_definition" "prod-ecs-task-def" {
  family                   = "proddef"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 1024
  memory                   = 3072
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode([
      {
      "name": "prod-ecr-repo",
      "image": "992382638511.dkr.ecr.ap-northeast-2.amazonaws.com/prod-ecr-repo",  
      "essential": true,
      "portMappings": [
        {
          "name": "prod-80-tcp",
          "containerPort": 80,
          "hostPort": 80,
          "protocol": "tcp",
          "appProtocol": "http"
        }
      ],
      "logconfiguration" : {
          "logdriver" : "awslogs",
          "options"    : {
            "awslogs-create-group": "true",
            "awslogs-group": "/ecs/prod-ecs-def",
            "awslogs-region": "ap-northeast-2",
            "awslogs-stream-prefix": "ecs"
        }
      } 
    }
  ])
  runtime_platform {
  operating_system_family = "LINUX"
  cpu_architecture = "X86_64"
 }

  tags = {
    Name   = "${var.basic_name}prod-ecs-def"
    Env    = var.env
    Author = var.author
  }
}

resource "aws_ecs_cluster" "prod-ecs-cluster" {
  name = "prod-ecs-cluster"
}

resource "aws_ecs_service" "prod-ecs-service" {
  name            = "prod-ecs-service"
  cluster         = aws_ecs_cluster.prod-ecs-cluster.id
  task_definition = aws_ecs_task_definition.prod-ecs-task-def.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.prod-asg-security-group.id]
    subnets          = [aws_subnet.prod-pri-sub.id, aws_subnet.prod-pri-sub2.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.prod-target-group.arn
    container_name   = aws_ecs_task_definition.prod-ecs-task-def.family
    container_port   = 80
  }

  alarms {
    enable   = true
    rollback = true
    alarm_names = [
      aws_cloudwatch_metric_alarm.ecs-cpu-util.alarm_name
    ]
  }

  depends_on = [aws_lb_listener.prod_alb_listener, aws_iam_role_policy_attachment.ecs_task_execution_role]

  tags = {
    Name   = "${var.basic_name}prod-ecs-service"
    Env    = var.env
    Author = var.author
  }
}