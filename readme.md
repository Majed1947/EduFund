# 🎓 EduFund

**EduFund** is a mobile and web application that connects students seeking short-term educational funding with micro-investors who are willing to provide financial support in exchange for future repayment.

---

## 📖 Description

Upon login, the app determines whether the user is a **student** or an **investor**. Based on the role:

- 🎓 **Students** see a personalized UI to submit funding requests, view their funding status, and track repayments.
- 💰 **Investors** are shown a dashboard to browse student requests, invest, and monitor returns.

All data is connected via a **Python Flask backend API**, with **PostgreSQL** as the database. The frontend is implemented using **Apple SwiftUI**, and the backend connects to the database using **Psycopg2**.

---

## 🚀 Getting Started

### 📦 Dependencies

- Python 3.x
- Flask
- Swift (iOS Development)
- PostgreSQL
- `psycopg2` (PostgreSQL adapter for Python)

---

## ⚙️ Backend Setup (Flask)

```bash
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py