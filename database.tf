resource "aws_db_instance" "aws-rds" {          #Provides an RDS instance resource
  allocated_storage    = 10                     #The allocated storage in gibibytes 
  db_name              = "mydb"                 #The name of the database to create when the DB instance is created
  engine               = "mysql"                
  engine_version       = "8.0.35"               
  instance_class       = "db.t3.micro"          #The instance type of the RDS instance
  username             = "admin"
  password             = "admin123"
  parameter_group_name = "default.mysql8.0"     #Name of the DB parameter group to associate
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.vsm-rds-sg.id]
  db_subnet_group_name = aws_db_subnet_group.vsm-rds-subnet-group.name #DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default Subnet Group. 
}


resource "aws_db_subnet_group" "vsm-rds-subnet-group" { #Provides an RDS DB subnet group resource
  name       = "vsm-rds-subnet-group" #The name of the DB subnet group.
  subnet_ids = [aws_subnet.vsm-subnet-1a.id, aws_subnet.vsm-subnet-1b.id] #A list of VPC subnet IDs.

  tags = {
    Name = "vsm-rds-subnet-group"
  }
}