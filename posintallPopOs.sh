#!/bin/bash
## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

##Instalando cURL
apt install curl -y &&

#Instalações para o Docker
sudo apt install apt-transport-https ca-certificates software-properties-common &&

##Docker-CE
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&

##Vagrant
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - &&
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" &&

##Atualizando o sistema
sudo apt update && sudo apt dist-upgrade

##Instalando arquivos pelo APT
sudo apt install wget python3 docker docker-compose git flatpak snapd docker-ce gnupg lsb-release vim nautilus-admin virtualbox-qt htop vagrant -y &&

##Instalando pelo snap
sudo snap install spotify &&

##Instalando Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl &&
chmod +x ./kubectl &&
sudo mv ./kubectl /usr/local/bin/kubectl &&

##Instalando Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
chmod +x ./minikube &&
sudo mv ./minikube /usr/local/bin/minikube &&
minikube config set driver virtualbox &&

##Instalando Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64 &&
chmod +x ./kind &&
sudo mv ./kind /usr/local/bin/kind &&

## Atualização do sistema ##

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&

##Configurando Docker sem sudo
sudo usermod -aG docker ${USER} &&
echo "Coloque a senha para configurar usuario docker" &&
su - ${USER} &&
echo "Finalizado"

