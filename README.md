# Push to deploy

This repository contains scripts for a Push-to-deploy system implemented with a VPS.

#### Getting started

* 1) Run the install.sh script on your server, this will install everything you need and generate secure passwords for PostgreSQL
```bash
cd ~
wget https://raw.githubusercontent.com/skoshx/push/master/install.sh
bash install.sh
```

* 2) Change your .ssh/config file, this will make you able to push to your remote repository with public key authentication.
```bash
Host (ip / domain)
  HostName (ip / domain)
  IdentityFile ~/.ssh/id_rsa (path to private key)
  IdentitiesOnly yes
```

* 4) Run `project-create.sh` on VPS

* 5) Add project as remote
```bash
# Add server repo as remote called "deploy"
git remote add deploy ssh://<your-name>@<your-ip>/srv/git/<your-app>.git/
```

* 6) Push to deploy!
```bash
# Push & deploy
git push deploy main
```

##### Troubleshooting

These push to scripts assume you are using a GitHub repository as a main repository, and thus
assumes your default branch is called "main" instead of "master". If you have a repository with
the default branch being called "master" you need to change this in your `post-receive` Git hook.

```bash
vim /srv/git/<your project>/hooks/post-receive

# replace this line:
git --work-tree=$TMP --git-dir=$GIT checkout -f main

# with this:
git --work-tree=$TMP --git-gir=$GIT checkout -f
```

##### TODO

* Self host Plausible? (https://plausible.io/docs/self-hosting#1-clone-the-hosting-repo)

