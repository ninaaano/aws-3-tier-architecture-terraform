#prod load balancer#

resource "aws_lb" "prod-alb" {
  name               = var.prod_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod-alb-sg.id]
  subnets            = [aws_subnet.prod-nat-sub.id, aws_subnet.prod-nat-sub2.id]

  tags = {
    Name   = var.basic_name + var.prod_alb_name
    Env    = var.env
    Author = var.author
  }

}

#prod target group#

resource "aws_lb_target_group" "prod-target-group" {
  name        = "prod-tg-name"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.prod-vpc.id
  target_type = "ip"

  health_check {
    path    = "/"
    matcher = 200
  }

  tags = {
    Name   = var.basic_name + var.prod_tg_name
    Env    = var.env
    Author = var.author
  }
}

resource "aws_lb_listener" "prod_alb_listener" {
  load_balancer_arn = aws_lb.prod-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prod-target-group.arn
  }

}
