resource "aws_lb" "vsm-alb" {
  name               = "vsm-alb"
  internal           = false #If true, the LB will be internal. Defaults to false.
  load_balancer_type = "application"
  security_groups    = [aws_security_group.vsm-alb-sg.id] #List of security group IDs to assign to the LB. 
  subnets            = [aws_subnet.vsm-subnet-1a.id,aws_subnet.vsm-subnet-1b.id] #List of subnet IDs to attach to the LB. 

  enable_deletion_protection = false

  tags = {
    Name = "vsm-alb"
    Environment = "production"
  }
}

resource "aws_lb_target_group" "vsm-tg" {
  name     = "vsm-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vsm-vpc.id
}

resource "aws_lb_listener" "vsm-alb-listener" {
  load_balancer_arn = aws_lb.vsm-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vsm-tg.arn
  }
}
