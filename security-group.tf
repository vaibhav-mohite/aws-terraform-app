resource "aws_security_group" "vsm-alb-sg" {
  name        = "vsm-alb-sg"
  description = "Security Group for ALB"
  vpc_id      = aws_vpc.vsm-vpc.id

  tags = {
    Name = "vsm-alb-sg"
  }

  ingress {
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port   = 80
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "vsm-ec2-sg" {
  name        = "vsm-ec2-sg"
  description = "Security Group for EC2"
  vpc_id      = aws_vpc.vsm-vpc.id

  tags = {
    Name = "vsm-ec2-sg"
  }

  ingress {
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port   = 80
  }

  ingress {
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port   = 22
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "vsm-rds-sg" {
  name        = "vsm-rds-sg"
  description = "Security Group for RDS"
  vpc_id      = aws_vpc.vsm-vpc.id

  tags = {
    Name = "vsm-rds-sg"
  }

  ingress {
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 3306
    to_port   = 3306
    security_groups = [aws_security_group.vsm-ec2-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}