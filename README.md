# 🎓 EdTech Platform

A full-stack EdTech web application with React frontend, Node.js backend, and Python AI microservice.

![Tech Stack](https://img.shields.io/badge/React-18-61dafb?style=flat-square&logo=react)
![Tech Stack](https://img.shields.io/badge/Node.js-Express-339933?style=flat-square&logo=node.js)
![Tech Stack](https://img.shields.io/badge/MongoDB-Mongoose-47A248?style=flat-square&logo=mongodb)
![Tech Stack](https://img.shields.io/badge/Python-FastAPI-009688?style=flat-square&logo=fastapi)
![Tech Stack](https://img.shields.io/badge/Tailwind-CSS_3-06B6D4?style=flat-square&logo=tailwindcss)

---

## 📋 Features

### 👤 Authentication
- Email + OTP signup verification
- JWT-based login with role selection (Student/Instructor)
- Password reset via email link
- Change password (authenticated)

### 📚 Course Management
- **Instructors**: Create, edit, delete courses with sections & video lectures
- **Students**: Browse catalog, view details, purchase courses
- Cloudinary-based media uploads (thumbnails & videos)
- Category-based organization
- Ratings & reviews

### 💳 Payments
- Razorpay integration for course purchases
- Cart system with multi-course checkout
- Payment verification & enrollment
- Success email notifications

### 📊 Dashboards
- **Student**: Enrolled courses with progress tracking, profile management
- **Instructor**: Revenue analytics, student count, course management, pie charts

### 🤖 AI Features
- AI chatbot (OpenAI / Google Gemini / offline fallback)
- Course recommendations engine
- Learning path generator
- Web search for resources (Tavily)
- Assessment question generator

---

## 🏗️ Architecture

```
edtechby Rishabh/
├── client/          → React + Vite + Tailwind + Redux (Port 5173)
├── server/          → Node.js + Express + MongoDB (Port 4000)
├── ai-service/      → Python + FastAPI (Port 8000)
├── .env.example
└── README.md
```

---

## 🚀 Quick Start

### Prerequisites
- **Node.js** v18+ & npm
- **Python** 3.10+
- **MongoDB** (Atlas recommended)
- **Cloudinary** account
- **Razorpay** account (test mode)

### 1. Clone & Setup

```bash
# Navigate to project
cd "edtechby Rishabh"
```

### 2. Backend Setup

```bash
cd server
cp .env.example .env
# Edit .env with your credentials (MongoDB, Cloudinary, Razorpay, etc.)
npm install
npm run dev
```

The server starts at `http://localhost:4000`

### 3. Frontend Setup

```bash
cd client
npm install

# Optional: Create .env for Razorpay key
echo "VITE_RAZORPAY_KEY=rzp_test_xxxx" > .env

npm run dev
```

The app opens at `http://localhost:5173`

### 4. AI Service Setup

```bash
cd ai-service
pip install -r requirements.txt
cp .env.example .env
# Edit .env with your API keys (optional — works offline too)
python main.py
```

The AI service runs at `http://localhost:8000` (Swagger docs at `/docs`)

---

## 🔑 Environment Variables

### Server (`server/.env`)

| Variable | Description | Required |
|----------|-------------|----------|
| `PORT` | Server port (default: 4000) | No |
| `MONGODB_URL` | MongoDB connection string | **Yes** |
| `JWT_SECRET` | JWT signing secret | **Yes** |
| `CLOUD_NAME` | Cloudinary cloud name | **Yes** |
| `API_KEY` | Cloudinary API key | **Yes** |
| `API_SECRET` | Cloudinary API secret | **Yes** |
| `FOLDER_NAME` | Cloudinary upload folder | No |
| `RAZORPAY_KEY` | Razorpay key ID | **Yes** |
| `RAZORPAY_SECRET` | Razorpay key secret | **Yes** |
| `MAIL_HOST` | SMTP host (e.g., smtp.gmail.com) | **Yes** |
| `MAIL_USER` | Sender email | **Yes** |
| `MAIL_PASS` | Email app password | **Yes** |
| `FRONTEND_URL` | Frontend URL for CORS | No |
| `AI_SERVICE_URL` | AI service URL | No |

### AI Service (`ai-service/.env`)

| Variable | Description | Required |
|----------|-------------|----------|
| `LLM_PROVIDER` | "openai" or "gemini" | No |
| `OPENAI_API_KEY` | OpenAI API key | No* |
| `GEMINI_API_KEY` | Google Gemini key | No* |
| `TAVILY_API_KEY` | Tavily search key | No |

*The AI chatbot works in offline mode with pre-built responses if no API key is provided.

---

## 🗃️ Database Setup

1. Create a [MongoDB Atlas](https://www.mongodb.com/atlas) free cluster
2. Create a database user
3. Whitelist your IP (or allow all: `0.0.0.0/0`)
4. Copy the connection string to `MONGODB_URL`

### Seed Categories (run once via Postman/curl):

```bash
# Create categories (requires admin account)
curl -X POST http://localhost:4000/api/v1/course/createCategory \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <admin-token>" \
  -d '{"name": "Web Development", "description": "Full-stack web development courses"}'

curl -X POST http://localhost:4000/api/v1/course/createCategory \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <admin-token>" \
  -d '{"name": "Data Science", "description": "Data science and machine learning courses"}'

curl -X POST http://localhost:4000/api/v1/course/createCategory \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <admin-token>" \
  -d '{"name": "Mobile Development", "description": "iOS and Android development"}'
```

---

## 📡 API Endpoints

### Auth
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/auth/sendotp` | Send OTP |
| POST | `/api/v1/auth/signup` | Register |
| POST | `/api/v1/auth/login` | Login |
| POST | `/api/v1/auth/reset-password-token` | Request reset |
| POST | `/api/v1/auth/reset-password` | Reset password |

### Courses
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/course/getAllCourses` | All published courses |
| POST | `/api/v1/course/getCourseDetails` | Course details |
| POST | `/api/v1/course/createCourse` | Create course (instructor) |
| GET | `/api/v1/course/showAllCategories` | All categories |

### Payments
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/payment/capturePayment` | Create order |
| POST | `/api/v1/payment/verifyPayment` | Verify & enroll |

### AI
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/ai/chat` | Chatbot |
| POST | `/api/v1/ai/recommend` | Recommendations |
| POST | `/api/v1/ai/search` | Web search |
| POST | `/api/v1/ai/assessment` | Generate quiz |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18, Vite 5, Tailwind CSS 3, Redux Toolkit |
| Backend | Node.js, Express 4, Mongoose 7 |
| Database | MongoDB Atlas |
| Auth | JWT, bcryptjs, OTP |
| Payments | Razorpay |
| File Upload | Cloudinary |
| AI/ML | FastAPI, OpenAI/Gemini, Tavily |
| Email | Nodemailer |
| Charts | Chart.js, react-chartjs-2 |

---

## 📝 License

This project is built for educational purposes.

---

Made with ❤️ by Rishabh
