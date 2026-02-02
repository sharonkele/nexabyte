resource "aws_launch_template" "foobar" {
  name_prefix   = "nexabyte-asg"
  image_id      = var.ami_id
  instance_type = var.instance_tpe
  user_data = templatefile("./userdata.sh") 
  network_interfaces {
    associate_public_ip_address = false
    security_groups = aws_security_group.allow_tls.id
  } 

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
        volume_size = 
        volume_type = 
        delete_on_termination = 
    }
  }
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