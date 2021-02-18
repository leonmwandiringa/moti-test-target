#! /bin/bash
sudo apt update -y
sudo apt install openjdk-11-jre -y
sudo apt install openjdk-11-jdk -y
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c "echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"
sudo apt update -y
sudo apt install jenkins -y
sudo ufw allow 8080
sudo apt install awscli -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt update -y
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> file2