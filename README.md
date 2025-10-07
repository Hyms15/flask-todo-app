![CI Status](https://github.com/Hyms15/flask-todo-app/actions/workflows/ci.yml/badge.svg)

# 🧩 Flask ToDo App – End-to-End Automation Project

A complete **Flask ToDo App** with CRUD APIs and an **SQLite backend**, built to demonstrate modern **DevOps & automation** best practices.

---

## 🚀 Project Overview

This project implements a full DevOps automation pipeline from **code to deployment**.  
It showcases how to automate testing, build, containerization, and deployment using GitHub Actions and Docker.

---

## 🔧 DevOps Epics Implemented

A total of **10 core DevOps epics** (out of 20 planned) are implemented to cover the end-to-end workflow:

1️⃣ **GitHub Actions CI/CD** – Automated build, test, and deploy  
2️⃣ **Testing** – Unit & integration tests using Pytest  
3️⃣ **Branch Protection & Code Reviews** – Enforced merge rules for main branch stability  
4️⃣ **Dockerization & Container Setup** – Multi-stage Docker build for optimized image size  
5️⃣ **Cloud Deployment** – Hosted Flask app on cloud  
6️⃣ **Monitoring & Logging Setup** – Observability configuration  
7️⃣ **Security & Secrets Management** – Safe handling of credentials via GitHub Secrets  
8️⃣ **Automation with Ansible / Infra as Code (IaC)** – Infrastructure provisioning and automation  
9️⃣ **Database Migration & Versioning** – Controlled DB schema evolution  
🔟 **End-to-End Demo & Documentation** – Complete project walkthrough and validation

---

## 👥 Collaboration

✅ A collaborative project by a **4-member team** —  
each epic implemented step-by-step to showcase **modern DevOps + Python best practices**.

---

## 🐳 Docker Image

This project is **containerized using a multi-stage Docker build** for optimized performance and smaller image size.

### 🔹 Docker Hub Repository
👉 [**hyma1569/flask-todo-app**](https://hub.docker.com/r/hyma1569/flask-todo-app)

### 🔹 Available Tags
- `v1.0.0`
- `latest`

### 🔹 Run Locally
```bash
docker pull hyma1569/flask-todo-app:v1.0.0
docker run -p 5001:5000 hyma1569/flask-todo-app:v1.0.0
# Test trigger for Epic 3 Story 1
