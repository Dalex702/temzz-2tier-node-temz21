## Two-Tier Dockerized Web Application Deployment

# Project Overview
This project demonstrates the deployment of a two-tier application (frontend + backend) using Docker and GitHub Actions CI/CD.  
The system consists of:
- Frontend: Static HTML/CSS website served with Nginx.
- Backend: Node.js REST API.
- Infrastructure: Deployed on a Linux VM with Docker Compose.

---
Architecture Overview

            ┌────────────────────────┐
            │      Frontend (Nginx)  │
            │  - HTML/CSS Website    │
            │  - Serves UI           │
            └──────────┬─────────────┘
                       │
                       ▼
            ┌────────────────────────┐
            │     Backend (Node.js)  │
            │  - API: /api           │
            │  - Port: 5000          │
            └────────────────────────┘
                       │
                       ▼
            ┌────────────────────────┐
            │     Docker Compose     │
            │  - Multi-container app │
            └────────────────────────┘
                       │
                       ▼
            ┌────────────────────────┐
            │   GitHub Actions CI/CD │
            │  - Builds images       │
            │  - Pushes to DockerHub │
            │  - Deploys to VM       │
            └────────────────────────┘




Technologies Used
- Frontend: HTML, CSS, Nginx
- Backend: Node.js, Express
- Containerization: Docker, Docker Compose
- Automation: GitHub Actions CI/CD
- Hosting: Azure Linux VM (Ubuntu)

---
Folder Structure

two-tier-app
├── frontend/
│   ├── index.html
│   ├── styles.css
│   ├── nginx.conf
│   └── Dockerfile
│
├── backend/
│   ├── index.js
│   ├── package.json
│   └── Dockerfile
│
├── docker-compose.yml
├── .github/
│   └── workflows/
│       ├── deploy.yml
│       └── ci-cd.yml
└── README.md

Setup & Deployment Instructions

Clone Repository
bash
git clone https://github.com/<your-username>/two-tier-app.git
cd two-tier-app

2️. Build and Run Locally with Docker Compose
bash
docker-compose up --build
```
Access:
- Frontend: http://localhost:80
- Backend: http://localhost:5000/api

3️. Push Docker Images to DockerHub
bash
docker tag frontend:latest yourusername/frontend:v1
docker tag backend:latest yourusername/backend:v1
docker push yourusername/frontend:v1
docker push yourusername/backend:v1


4️. Deploy on Linux VM
SSH into the VM:
bash
ssh azureuser@20.51.136.9

Then run:
bash
docker-compose pull
docker-compose up -d

GitHub Actions CI/CD Workflow

.github/workflows/ci-cd.yml
Automates:
- Build frontend/backend images
- Push to DockerHub

.github/workflows/deploy.yml
Automates:
- SSH into VM
- Pulls new Docker images
- Restarts containers

# Screenshots
- Docker Images built successfully  
- DockerHub repository showing uploaded images  
- Azure Linux VM terminal showing deployment success  
- Browser screenshot of live frontend and backend API output

(All screenshots attached in documentation folder)

Challenges & Solutions
Challenge 1: SSH Authentication in GitHub Actions
Issue: SSH key was not recognized during automation.  
Solution: Generated new key pair using `ssh-keygen`, added public key to VM’s `~/.ssh/authorized_keys`, and configured private key in GitHub Secrets.

Challenge 2: Container Network Configuration
Issue: Frontend couldn’t reach backend due to wrong service name.  
Solution: Updated Nginx config to reference backend service via Docker network alias.

Lessons Learned
- Gained hands-on experience in Docker multi-container orchestration.  
- Learned to configure Nginx reverse proxy for static websites.  
- Automated deployment workflow with GitHub Actions and SSH integration.  
- Understood practical DevOps workflow — Build → Push → Deploy.

Public Deployment
Live Frontend URL: http://20.51.136.9/
Backend API Endpoint: http://20.51.136.9/api

(Accessible via port 80 only as required)

Deliverables Checklist
✅ `Dockerfile` for Frontend and Backend  
✅ `docker-compose.yml`  
✅ GitHub Actions CI/CD Workflow (`deploy.yml` & `ci-cd.yml`)  
✅ Screenshots of Deployment  
✅ Publicly accessible system  
✅ Complete Documentation (this README)

---
**Author**: Group 3
**Project**: Two-Tier Application Deployment with Docker & GitHub Actions  
**Date**: 3rd November, 2025 Two-Tier Dockerized Web Application Deployment