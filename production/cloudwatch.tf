### CloudWatch Log-group & log-stream
resource "aws_cloudwatch_log_group" "log-group" {
  name              = "prod-log-group"
  retention_in_days = "7"
}
resource "aws_cloudwatch_log_stream" "log-stream" {
  name           = "prod-log-stream"
  log_group_name = aws_cloudwatch_log_group.log-group.name
}

resource "aws_cloudwatch_metric_alarm" "ecs-cpu-util" {
  alarm_name                = "terraform-ecs-util"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ECS"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors ECS CPU utilization"
  insufficient_data_actions = []

  dimensions = {
    ClusterName  = "my-ecs-cluster"
    ServiceName  = "my-ecs-service"
  }
}
