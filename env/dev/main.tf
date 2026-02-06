module "asg" {
    source = "../../modules/asg"
    ami_id = "ami-096f46d460613bed4"
    instance_type = "t3.small"
    ec2_role_name = "nexabyte-ec2-server"
}