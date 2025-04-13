resource "aws_lb" "myalb" {
     load_balancer_type = var.load_balan_type
  security_groups = [var.raj_public_sg_elb]   
 subnet_mapping {
    subnet_id     = var.raj_public_sub_1_elb
     }

  subnet_mapping {
    subnet_id     = var.raj_public_sub_2_elb
    
  }
  tags = {
    Name = "application_lb"
  }
}

resource "aws_lb_target_group" "target_group" {
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.rajvpc_elb
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.raj_web_1_elb
  port             = "80"
}

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.raj_web_2_elb
  port             = "80"
}

