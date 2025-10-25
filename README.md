# Temzz 2-Tier Node.js + Docker (temz21)

This project is a 2-tier web application (Node.js backend + static frontend) containerized with Docker.
Images are named with Docker Hub username `temz21` (temz21/temzz-backend and temz21/temzz-frontend).

## Quick local run
1. Install Docker and Docker Compose.
2. From project root run:
   docker-compose up --build
3. Open http://localhost and click "Call Backend".

## CI/CD
The included GitHub Actions workflow (.github/workflows/ci-cd.yml) will:
- Build images for frontend and backend
- Push images to Docker Hub (using secrets)
- SCP a deploy compose file to your VM and SSH to run docker compose up -d

### Required GitHub Secrets
- DOCKERHUB_USERNAME
- DOCKERHUB_TOKEN
- VM_SSH_HOST
- VM_SSH_USER
- VM_SSH_KEY (private key, newline preserved)
- VM_REMOTE_DIR (e.g., /home/ubuntu/temzz-deploy)

## Manual VM deploy
1. On VM: run vm-setup.sh to install Docker.
2. Copy deploy-docker-compose.yml to VM deploy dir.
3. Run:
   docker compose pull
   docker compose up -d
