resource "aws_launch_template" "foobar" {
  name   = "nexabyte-asg"
  image_id      = var.ami_id
  instance_type = var.instance_tpe
  user_data = templatefile("./userdata.sh")
  key_name = "aws_linux" 
  iam_instance_profile {
    name = 
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
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}