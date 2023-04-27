# Launch Template Resource
resource "aws_launch_template" "launchtemplate_back4" {
  name     = "launchtemplate_back4"
  image_id = "ami-0df24e148fdb9f1d8"
  # image_id = "ami-0747e613a2a1ff483"
  instance_type = "t2.micro"
  # iam_instance_profile = "arn:aws:iam::414207150251:instance-profile/LabInstanceProfile"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  key_name               = "vockey"
  user_data = base64encode(file("${path.module}/backend_app.sh"))                                                         
  monitoring {
    enabled = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Backend_app"
    }
  }
}
                                                                                                      