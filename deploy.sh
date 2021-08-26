cd <your-app>

# Initialize git repo
git init

# Add server repo as remote called "deploy"
git remote add deploy ssh://<your-name>@<your-ip>/srv/git/<your-app>.git/

# Push & deploy
git push deploy master

