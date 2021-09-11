
printf "Installing NodeJS…\n"

cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs

printf "Installing PM2…\n"

npm install pm2@latest -g

printf "Downloading project-create.sh…\n"

wget -O project-create.sh https://raw.githubusercontent.com/skoshx/push/master/project-create.sh

printf "Downloading project-delete.sh…\n"

wget -O project-delete.sh https://raw.githubusercontent.com/skoshx/push/master/project-delete.sh

printf "Installing PostgreSQL…\n"

sudo apt update
sudo apt install postgresql postgresql-contrib -y

printf "Setting up PostgreSQL…\n"

read -p "Postgres account username: " username
sudo -u postgres createuser $username
read -p "Postgres database name: " dbname
sudo -u postgres createdb $dbname
read -sp "Postgres password: " password

sudo -u postgres psql
alter user $username with encrypted password $password;
grant all privileges on database $dbname to $username;

printf "Installing Caddyserver…\n"

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-stable.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

printf "Setting up firewall…\n"

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable -y
