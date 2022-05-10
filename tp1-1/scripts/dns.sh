#!/bin/bash

echo "Authentication settings"

echo "172.0.0.3 front.local" >> /etc/hosts

echo "172.0.0.4 back.local" >> /etc/hosts

echo "Install sshpass"
sudo apt-get update && sudo apt-get install sshpass -y

echo "Generate an ssh key-pair"
ssh-keygen -t ecdsa -f ~/.ssh/id_ecdsa
echo "copying the public key on front node"
sshpass -p vagrant ssh-copy-id -i ~/.ssh/id_ecdsa.pub vagrant@front.local
echo "copying the public key on back node"
sshpass -p vagrant ssh-copy-id -i ~/.ssh/id_ecdsa.pub vagrant@back.local
