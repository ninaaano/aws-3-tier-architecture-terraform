[
    {
      "name": "${app_name}",
      "image": "${aws_ecr_repository}:${tag}",
      "essential": true,
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-region": "${region}",
          "awslogs-stream-prefix": "staging-service",
          "awslogs-group": "awslogs-service-staging"
        }
      },
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80,
          "protocol": "tcp"
        }
      ],
      "cpu": 256,
      "environment": [
        {
          "name": "PORT",
          "value": "80"
        }
      ],
      "ulimits": [
        {
          "name": "nofile",
          "softLimit": 65536,
          "hardLimit": 65536
        }
      ],
      "mountPoints": [],
      "memory": 512,
      "volumesFrom": []
    }
  ]