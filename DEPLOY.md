# 🚀 Deployment Guide: EdTech Platform

This guide explains how to run your EdTech platform "not locally" using Docker or Cloud Platforms.

## 🛠️ Method 1: Using Docker (Recommended for VPS)

Docker allows you to run the entire stack (Frontend, Backend, AI) on any server (DigitalOcean, AWS, Azure) with a single command.

### 1. Prerequisites
- A server with **Docker** and **Docker Compose** installed.
- Your `.env` files must be filled out (I've already updated your `server/.env` with the Atlas link).

### 2. Launching the App
Run this command from the project root:
```bash
docker-compose up --build -d
```

### 3. Accessing the App
- **Frontend**: http://your-server-ip (Port 80)
- **Backend**: http://your-server-ip:4000
- **AI Service**: http://your-server-ip:8000

---

## ☁️ Method 2: PaaS (Easiest / No Server Managed)

If you don't want to use Docker, you can deploy each part individually:

### 1. Frontend (Vercel / Netlify)
- Connect your GitHub repo.
- Point it to the `client/` folder.
- **Build Command**: `npm run build`
- **Output Directory**: `dist`

### 2. Backend & AI (Render / Railway)
- **Backend**: Point to the `server/` folder.
- **AI Service**: Point to the `ai-service/` folder.
- Add all your `.env` variables to the platform's dashboard.

---

## 🔑 Critical Environment Variables
Make sure these are set in your deployment environment:
- `MONGODB_URL`: (Already set to your Atlas string)
- `CLOUD_NAME`, `API_KEY`, `API_SECRET`: (Cloudinary)
- `RAZORPAY_KEY`, `RAZORPAY_SECRET`: (Payments)
- `JWT_SECRET`: (Auth)
- `MAIL_USER`, `MAIL_PASS`: (Email OTPs)
