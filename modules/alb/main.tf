resource "aws_lb" "ecs_alb" {

 name               = "${var.env}-ecs-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = [var.sg_id]
 subnets            = [var.subnet_id, var.subnet2_id]

 tags = {
   name = "${var.env}-ecs-alb"
 }
}



resource "aws_lb_listener" "ecs_alb_listener" {

 load_balancer_arn = aws_lb.ecs_alb.arn
 port              = 80
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.ecs_tg.arn
 }
}



resource "aws_lb_target_group" "ecs_tg" {

 name        = "${var.env}-ecs-tg"
 port        = 5000
 protocol    = "HTTP"
 target_type = "ip"
 vpc_id      = var.vpc_id

 health_check {
   path = "/"
   port = "5000"
 }
}