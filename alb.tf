#stage load balancer#

resource "aws_lb" "stage-alb" {
  name               = var.stage_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.stage-alb-sg.id]
  subnets            = [aws_subnet.stage-nat-sub.id]
}

#prod load balancer#

resource "aws_lb" "prod-alb" {
  name               = var.prod_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod-alb-sg.id]
  subnets            = [aws_subnet.prod-nat-sub.id, aws_subnet.prod-nat-sub2.id]

  tags = {
    Environment = "prod"
    Application = var.app_name
  }

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

#prod target group#

resource "aws_lb_target_group" "prod-target-group" {
  name     = "prod-tg-name"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prod-vpc.id
  health_check {
    path = "/"
    matcher = 200
  }
}

resource "aws_lb_listener" "prod_alb_listener" {
 load_balancer_arn = aws_lb.prod-alb.arn
 port              = 80
 protocol          = "HTTP"

 default_action {
   type             = "redirect"
 

   redirect {
     port        = "443"
     protocol    = "HTTPS"
     status_code = "HTTP_301"
   }
 }
}

resource "aws_lb_listener" "prod-https-forward" {
  load_balancer_arn = aws_lb.prod-alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.cert.arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prod-target-group.arn
  }
}