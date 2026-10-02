#!/usr/bin/env bash

## Parar e remover serviço apache instalado com PHP 8 #
sudo /etc/init.d/apache2 stop
sudo systemctl stop apache2.service
sudo systemctl stop apache2
sudo systemctl disable apache2
sudo systemctl stop nginx.service
sudo systemctl stop nginx
sudo systemctl disable nginx
sudo apt remove nginx nginx-common -y
# # Fedora e derivados RedHat
# sudo systemctl stop httpd
# sudo systemctl disable httpd
sudo apt remove apache2 -y

echo " "
echo "Atualizações concluídas"
read -s -n 1 -p "Pressione Enter para sair..."
exit
