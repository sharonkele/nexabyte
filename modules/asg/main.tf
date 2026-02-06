resource "aws_launch_template" "foobar" {
  name   = "nexabyte-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data = templatefile("./userdata.sh")
  key_name = "aws_linux" 
  iam_instance_profile {
    name = aws_iam_role.ec2_role.name
  }
  network_interfaces {
    associate_public_ip_address = true
  } 

  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
        volume_size = 20
        volume_type = "gp3"
    }
  }


  vpc_security_group_ids = aws_security_group.allow_tls.id
  }

resource "aws_autoscaling_group" "bar" {
  name = "nexabyte-asg"
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  health_check_grace_period = 300
  health_check_type = "ELB"


  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}


