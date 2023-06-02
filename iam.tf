resource "aws_iam_user" "lb111" {
  name = "demo-user111"
  path = "/system/"
}

resource "aws_s3_bucket" "example1" {  
    bucket = "my-tf-test-bucket-sapient-saurabharora"
    tags = {    
            Name        = "My bucket1"    
            Environment = "Dev"  
            }
}
resource "aws_security_group" "ec2-sg1" {
  name = "myec2-sg1"
  
  ingress {
    description      = "ingress port for vault"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "ingress port for vault"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "eip1" {
    vpc = true
}
