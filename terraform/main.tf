provider "aws" {
  region = "us-east-1a"   
}


resource "aws_security_group" "jenkins_sg" {
  name        = "MYSG"
  description = "Allow SSH and Jenkins web access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my_instance" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
  key_name      = "Mykeypair"            
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "Myserver"
  }
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "Prasannabucket"
}
