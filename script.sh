#!/bin/bash

# Update and install Java
sudo apt update -y
sudo apt install fontconfig openjdk-21-jre -y

# Add Jenkins key and source list
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update and install Jenkins
sudo apt-get update -y
sudo apt-get install jenkins -y

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Docker
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker

# Add Jenkins and Ubuntu user to Docker group
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
newgrp docker

# Fix permissions
sudo chmod 777 /var/run/docker.sock
