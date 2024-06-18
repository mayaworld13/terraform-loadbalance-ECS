resource "aws_instance" "web" {
  count                  = 2
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.pub.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "${var.host-name}-${count.index + 1}"
  }

# Connection details for remote-exec provisioner
  connection {
    type        = "ssh"
    user        = var.connection-user
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  
  # Provisioner for remote execution
  provisioner "remote-exec" {
  inline = [
    "sudo apt-get update",
    "curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip",
    "sudo apt install unzip -y",
    "unzip awscliv2.zip",
    "sudo ./aws/install",
    "aws configure set aws_access_key_id ${var.access_key}",
    "aws configure set aws_secret_access_key ${var.secret_key}",
    "aws configure set default.region ${var.region}",
    "sudo apt-get install -y ca-certificates curl",
    "sudo install -m 0755 -d /etc/apt/keyrings",
    "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc",
    "sudo chmod a+r /etc/apt/keyrings/docker.asc",
    "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \\\"$VERSION_CODENAME\\\") stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
    "sudo apt-get update",
    "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
    "sudo systemctl enable docker --now",
    "wget https://raw.githubusercontent.com/mayaworld13/terraform-vpc-loadbalancer/main/public-subnet-1b/index.html",
    "wget https://raw.githubusercontent.com/mayaworld13/terraform-loadbalance-ECS/main/Dockerfile",
    "sudo docker build -t web:v1 .",
    "sudo docker run -d -p 4000:80 web:v1",
    "aws ecr get-login-password --region ${var.region} | sudo docker login --username AWS --password-stdin ${data.aws_ecr_repository.foo.repository_url}",
    "sudo docker tag web:v1 ${data.aws_ecr_repository.foo.repository_url}:v1",
    "sudo docker push ${data.aws_ecr_repository.foo.repository_url}:v1"
  ]
}

}


