//
//  LoginView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/24/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var userRole: String
    @Binding var showSignup: Bool

    @State private var email = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                print("🔐 Logging in with:", email, password)
                login(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)

            Button("Don't have an account? Sign up") {
                print("🟦 Switching to signup view")
                showSignup = true
            }
        }
        .padding()
        .alert("Login Response", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(loginMessage)
        }
    }

    func login(email: String, password: String) {
        guard let url = URL(string: "http://192.168.3.18:3000/login") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    loginMessage = "❌ No response from server."
                    showAlert = true
                }
                return
            }

            if httpResponse.statusCode == 200,
               let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                print("📦 Full login response:", json)

                if let role = json["role"] as? String,
                   let msg = json["message"] as? String {
                    DispatchQueue.main.async {
                        userRole = role.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                        loginMessage = msg
                        isLoggedIn = true
                        showAlert = true
                    }
                } else {
                    DispatchQueue.main.async {
                        loginMessage = "⚠️ Could not extract role or message."
                        showAlert = true
                    }
                }
            } else {
                DispatchQueue.main.async {
                    loginMessage = "⚠️ Invalid email or password."
                    showAlert = true
                }
            }
        }.resume()
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false), userRole: .constant(""), showSignup: .constant(false))
}
