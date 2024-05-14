#stage load balancer#

resource "aws_lb" "stage-alb" {
  name               = var.stage_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.stage-alb-sg.id]
  subnets            = [aws_subnet.stage-nat-sub.id, aws_subnet.stage-nat-sub2.id]
}

#stage target group#

resource "aws_lb_target_group" "stage-target-group" {
  name     = "stage-tg-name"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.stage-vpc.id
  health_check {
    path = "/stage"
    matcher = 200
  }

}

resource "aws_lb_listener" "stage_alb_listener" {
 load_balancer_arn = aws_lb.stage-alb.arn 
 port              = "80"
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.stage-target-group.arn
 }
}