![CI Status](https://github.com/Hyms15/flask-todo-app/actions/workflows/ci.yml/badge.svg)


🧩 Flask ToDo App – End-to-End Automation Project

Built a full Flask ToDo App with CRUD APIs and SQLite backend.

Implemented 20 Epics covering complete DevOps & automation workflow:
1️⃣ GitHub Actions CI/CD – automated build, test, and deploy
2️⃣ Testing – unit & integration tests with Pytest
3️⃣ Branch Protection & Code Reviews – enforced merge rules
4️⃣ Dockerization & Container Setup
5️⃣ Deployment on Cloud (Flask App Hosting)
6️⃣ Monitoring & Logging Setup
7️⃣ Security & Secrets Management
8️⃣ Automation with Ansible / Infra as Code
9️⃣ Database Migration & Versioning
🔟 End-to-End Demo & Documentation

✅ A collaborative project by a 4-member team — each epic implemented step-by-step to showcase modern DevOps + Python best practices.

## 🐳 Docker Image

This project is containerized using a **multi-stage Docker build** for optimized performance.

### 🔹 Docker Hub Repository
👉 [hyma1569/flask-todo-app](https://hub.docker.com/r/hyma1569/flask-todo-app)

### 🔹 Available Tags
- `v1.0.0`
- `latest`

### 🔹 How to Run Locally
```bash
docker pull hyma1569/flask-todo-app:v1.0.0
docker run -p 5001:5000 hyma1569/flask-todo-app:v1.0.0
