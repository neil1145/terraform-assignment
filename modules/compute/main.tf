# Key pair for SSH access
resource "aws_key_pair" "main" {
  key_name   = "${var.project}-${var.environment}-key"
  public_key = var.public_key != "" ? var.public_key : file("~/.ssh/id_rsa.pub")
}

# Ubuntu EC2 instance in public subnet
resource "aws_instance" "ubuntu" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.main.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get upgrade -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Hello from Terraform-provisioned Ubuntu instance!</h1>" > /var/www/html/index.html
              EOF

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "${var.project}-${var.environment}-ubuntu"
  }
}