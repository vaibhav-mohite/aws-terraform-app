 resource "aws_autoscaling_group" "vsm-asg" {
  availability_zones = ["ap-south-1a"]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.vsm-launch-template.id
    version = "$Latest"
  }
 }
 