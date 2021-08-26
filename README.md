# Push to deploy

This repository contains scripts for a Push-to-deploy system implemented with a VPS.

#### Getting started

* 1) Install NodeJS on VPS
```bash
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs
```

* 2) Install PM2 on VPS
```bash
npm install pm2@latest -g
```

* 3) Change your .ssh/config file
```bash
Host (ip / domain)
  HostName (ip / domain)
  IdentityFile ~/.ssh/id_rsa_old (path to private key)
  IdentitiesOnly yes
```

* 4) Run `project-create.sh` on VPS

* 5) Add project as remote
```bash
# Add server repo as remote called "deploy"
git remote add deploy ssh://<your-name>@<your-ip>/srv/git/<your-app>.git/
```

* 6) Create an ecosystem file for PM2: https://pm2.keymetrics.io/docs/usage/environment/

* 6) Push to deploy!
```bash
# Push & deploy
git push deploy master
```