resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  associate_public_ip_address = false

  tags = { Name = "Private-Web-Server" }

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello from Private Web Server" > index.html
    nohup python3 -m http.server 80 &
  EOF
}
