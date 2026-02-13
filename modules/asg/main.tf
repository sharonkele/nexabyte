resource "aws_launch_template" "foobar" {
  name   = "nexabyte-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data = filebase64("${path.module}/scripts/userdata.sh")
  key_name = "uni-aws-linux-web-servee" 
  iam_instance_profile {
    name = aws_iam_instance_profile.profile.name
  }
  network_interfaces {
    associate_public_ip_address = false
    security_groups =  [aws_security_group.allow_tls.id]
  } 

  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
        volume_size = 20
        volume_type = "gp3"
    }
  }

}

resource "aws_autoscaling_group" "bar" {
  name = "nexabyte-asg"
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  health_check_grace_period = 300
  health_check_type = "ELB"
  vpc_zone_identifier = [aws_subnet.private_subnet[0].id ]


  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}


