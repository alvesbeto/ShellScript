#!/usr/bin/env bash

# ## Adicionando/Confirmando arquitetura de 32 bits ##
# sudo dpkg --add-architecture i386

# sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoclean && sudo apt autoremove -y

# sudo apt install curl -y
# sudo apt install software-properties-common -y
# sudo apt install apt-transport-https -y
# sudo apt-get install ca-certificates wget curl lsb-release -y
# sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 -y
# sudo apt install build-essential -y
# sudo apt install dos2unix -y
# sudo apt install p7zip-rar p7zip-full lzma lzma-dev rar unrar-free p7zip ark ncompress -y
# sudo apt install network-manager-openvpn -y
# sudo apt install neovim -y
# sudo apt install clang -y
# sudo apt install cmake -y
# sudo apt install wget -y
# sudo apt install git git-flow -y
# sudo apt install zsh -y
# sudo apt install net-tools -y
# sudo apt install samba -y
# sudo apt install xrdp -y
# sudo apt install gcc -y
# sudo apt install g++ -y
# sudo apt install make -y
# sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev

# instalação PHP 8.5
sudo apt update -y
sudo apt install -y software-properties-common ca-certificates
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y

mapfile -t pacotes_antigos < <(dpkg-query -W -f='${Package}\n' 'php8.0*' 'php8.1*' 2>/dev/null || true)
if ((${#pacotes_antigos[@]})); then
  sudo apt purge -y "${pacotes_antigos[@]}"
fi

sudo apt install -y openssl mcrypt php8.5 php8.5-mcrypt php8.5-common php8.5-mysql php8.5-sqlite3 php8.5-dom php8.5-bcmath php8.5-xml php8.5-xmlrpc php8.5-curl php8.5-gd php8.5-imagick php8.5-cli php8.5-dev php8.5-imap php8.5-mbstring php8.5-soap php8.5-zip php8.5-intl php8.5-cgi php8.5-pgsql php8.5-ldap

## Instalacao Composer #
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
composer self-update

# libera as portas 80 e 443
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
# libera a porta 3306
sudo ufw allow 3306/tcp
# libera portas de envio e recebimento de e-mail
sudo ufw allow 25/tcp
sudo ufw allow 465/tcp
sudo ufw allow 587/tcp
# libera a porta 22
sudo ufw allow 22/tcp
# libera a porta 5900 para o vnc
sudo ufw allow 5900/tcp
# libera a porta 3389 para o rdp
sudo ufw allow 3389/tcp
# libera porta para ftp
sudo ufw allow 21/tcp
# Libera as conexões http e https
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 'Apache Full'
sudo ufw delete allow 'Apache'

# seta o timezone para America/Sao_Paulo
sudo timedatectl set-timezone America/Sao_Paulo

# instala e configura o apache
sudo apt install -y apache2 libapache2-mod-php8.5
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod ssl
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2 --no-pager

# instala e configura o mariadb
sudo apt install -y mariadb-server mariadb-client
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo systemctl status mariadb --no-pager

# configura o acesso remoto ao mariadb
sudo sed -i 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb

# configura o domínio
sudo apt install -y certbot python3-certbot-apache
echo "Informe o nome do dominio para o certificado SSL"
read -r dominio
if [[ -z "$dominio" ]]; then
  echo "Domínio vazio. O Script encerra."
  exit 1
fi

# configuração do subdominio blog.$dominio
sudo mkdir -p /var/www/blog
sudo tee "/etc/apache2/sites-available/blog.${dominio}.conf" >/dev/null <<EOF
<VirtualHost *:80>
    ServerName blog.${dominio}
    ServerAlias www.blog.${dominio}
    DocumentRoot /var/www/blog
    <Directory /var/www/blog>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog \${APACHE_LOG_DIR}/blog.${dominio}-error.log
    CustomLog \${APACHE_LOG_DIR}/blog.${dominio}-access.log combined
</VirtualHost>
EOF

# configuração do subdominio app.$dominio
sudo mkdir -p /var/www/app
sudo tee "/etc/apache2/sites-available/app.${dominio}.conf" >/dev/null <<EOF
<VirtualHost *:80>
    ServerName app.${dominio}
    ServerAlias www.app.${dominio}
    DocumentRoot /var/www/app/public
    <Directory /var/www/app/public>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog \${APACHE_LOG_DIR}/app.${dominio}-error.log
    CustomLog \${APACHE_LOG_DIR}/app.${dominio}-access.log combined
</VirtualHost>
EOF

# configuração do dominio principal
sudo tee "/etc/apache2/sites-available/${dominio}.conf" >/dev/null <<EOF
<VirtualHost *:80>
    ServerName ${dominio}
    ServerAlias www.${dominio}
    DocumentRoot /var/www/html
    <Directory /var/www/html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog \${APACHE_LOG_DIR}/${dominio}-error.log
    CustomLog \${APACHE_LOG_DIR}/${dominio}-access.log combined
</VirtualHost>
EOF

sudo a2ensite "blog.${dominio}.conf"
sudo a2ensite "app.${dominio}.conf"
sudo a2ensite "${dominio}.conf"
sudo systemctl reload apache2

sudo chown -R root:root /var/www/html /var/www/app /var/www/blog
sudo chmod -R 755 /var/www/html /var/www/app /var/www/blog

echo " "
echo "Servidor configurado."
read -s -n 1 -p "Pressione Enter para sair..."
exit
