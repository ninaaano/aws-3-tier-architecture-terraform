### CloudWatch Log-group & log-stream
resource "aws_cloudwatch_log_group" "log-group" {
  name              = "prod-log-group"
  retention_in_days = "7"
}
resource "aws_cloudwatch_log_stream" "log-stream" {
  name           = "prod-log-stream"
  log_group_name = aws_cloudwatch_log_group.log-group.name
}