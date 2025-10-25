#!/usr/bin/env bash
set -euo pipefail
sudo apt update -y
sudo apt install -y ca-certificates curl gnupg lsb-release
# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io
# Install docker compose plugin
sudo apt install -y docker-compose-plugin
sudo usermod -aG docker $USER || true
mkdir -p ~/temzz-deploy
echo 'VM setup complete. Place deploy-docker-compose.yml in ~/temzz-deploy and run:'
echo 'cd ~/temzz-deploy && docker compose pull && docker compose up -d'
