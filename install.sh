
echo "Installing NodeJS…\n"

cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs

echo "Installing PM2…\n"

npm install pm2@latest -g

echo "Downloading project-create.sh…\n"

wget -O project-create.sh https://raw.githubusercontent.com/skoshx/push/master/project-create.sh

echo "Downloading project-delete.sh…\n"

wget -O project-delete.sh https://raw.githubusercontent.com/skoshx/push/master/project-delete.sh

echo "Installing PostgreSQL…\n"

sudo apt update
sudo apt install postgresql postgresql-contrib

echo "Setting up firewall…\n"

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

echo "Installing Caddyserver…\n"

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-stable.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

echo "Done! Remember to set up your PostgreSQL user…"