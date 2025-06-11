print("hello")
from flask import Flask , request, jsonify
from db import data_base
from flask_cors import CORS


app = Flask(__name__)
CORS(app)


@app.route("/signup" , methods=['POST'])
def signup():
    data = request.get_json()
    conn = data_base()
    cur = conn.cursor()
    
    name = data["name"]
    email = data["email"].strip().lower()
    password = data["password"]
    role = data["role"]
    cur.execute("SELECT * from users WHERE email = %s" , (email,))
    email_found = cur.fetchone()
    if email_found:
        return jsonify({ "message": "email exists"}) , 409
    
    cur.execute("INSERT INTO users (name, email, password,role) VALUES (%s, %s,%s,%s)", (name, email, password,role))
    conn.commit()
    cur.close()
    conn.close()
    response = {
        "message": "You have created an account successfully",
        "name" : name,
        "email" : email
    }
    return jsonify(response) , 200



@app.route("/login" , methods=['POST'])
def login():
    data = request.get_json()
    
    email = data['email'].strip().lower()
    password = data['password']
    
    conn = data_base()
    cur = conn.cursor()
    cur.execute("SELECT * FROM users WHERE email = %s AND password = %s" , (email,password)) 
    user = cur.fetchone()
    print("✅ Fetched user:", user) 
    cur.close()
    conn.close()
    if user:
        return jsonify({
    "message": "Login successful",
    "role": user[4].lower()}), 200
    else:
        return jsonify({"message": "Invalid email or password"}), 401

    


app.run(host="0.0.0.0", port=3000)