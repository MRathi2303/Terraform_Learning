resource "aws_launch_template" "this" {
  name_prefix =     "3-tier-app-"
  image_id = var.ami_id
  instance_type = var.instance_type

 user_data = base64encode(file("${path.module}/userdata.sh"))

  tags = {
    Name = "3-tier-app-lt"
  }

}

resource "aws_autoscaling_group" "this" {
  name                      = "3-tier-app-asg"
  max_size                  = 2
  min_size                  = 2
  desired_capacity          = 2
  vpc_zone_identifier       = var.private_subnet_ids
  target_group_arns         = [var.target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 120

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "3-tier-app-ec2"
    propagate_at_launch = true
  }
}
