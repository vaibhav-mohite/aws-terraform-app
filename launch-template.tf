resource "aws_launch_template" "vsm-launch-template" {
  name = "vsm-launch-template"

  disable_api_stop        = false #If true, enables EC2 Instance Stop Protection
  disable_api_termination = false #If true, enables EC2 Instance Termination Protection

  ebs_optimized = false #If true, the launched EC2 instance will be EBS-optimized

  iam_instance_profile {
    name = "vsm-ssm-instance-role" #The IAM Instance Profile to launch the instance with
  }

  image_id = "ami-00bb6a80f01f03502"

  instance_initiated_shutdown_behavior = "stop" #Shutdown behavior for the instance

  instance_type = "t3.micro"

  key_name = "my-linux-instance-key-pair" #The key name to use for the instance

  #vpc_security_group_ids = [aws_security_group.vsm-ec2-sg.id]

  monitoring {
    enabled = false # If true, the launched EC2 instance will have detailed monitoring enabled
  }

  network_interfaces {
    associate_public_ip_address = true #Associate a public ip address with the network interface
  }

  tag_specifications { #The tags to apply to the resources during launch.
    resource_type = "instance"

    tags = {
      Name = "vsm-ec2-instance"
    }
  }
}
