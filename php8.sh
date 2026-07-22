#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
  clear
  echo "                       !!! ATENÇÃO !!!"
  echo "              NÃO execute este script como root!"
  echo "              Presione qualquer tecla para sair..."
  read -s -n 1 -p " "
  exit
fi

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo add-apt-repository ppa:ondrej/php -y

sudo apt update -y
# A linha abaixo é utilizada para distros baseadas no KDE Neon
sudo pkcon update -y
sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean

sudo apt install openssl mcrypt php8.5 php8.5-mcrypt php8.5-common php8.5-mysql php8.5-sqlite3 php8.5-dom php8.5-bcmath php8.5-xml php8.5-xmlrpc php8.5-curl php8.5-gd php8.5-imagick php8.5-cli php8.5-dev php8.5-imap php8.5-mbstring php8.5-soap php8.5-zip php8.5-intl php8.5-cgi php8.5-pgsql php8.5-ldap php8.5-fpm -y

## Parar e remover serviço apache instalado com PHP 8 #
sudo /etc/init.d/apache2 stop
sudo systemctl stop apache2.service
sudo systemctl stop apache2
sudo systemctl disable apache2
# # Fedora e derivados RedHat
# sudo systemctl stop httpd
# sudo systemctl disable httpd
sudo apt remove apache2 -y

## Instalacao Composer #
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
composer self-update

echo " "
echo "Atualizações concluídas"
read -s -n 1 -p "Pressione Enter para sair..."
exit
