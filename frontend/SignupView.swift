//
//  SignupView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/24/25.
//

import SwiftUI

struct SignupView: View {
    @Binding var isLoggedIn: Bool
    @Binding var userRole: String
    @Binding var showSignup: Bool
    

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var selectedRole = "student"  // default role

    @State private var signupMessage = ""
    @State private var showAlert = false

    let roles = ["student", "investor"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Picker("Account Type", selection: $selectedRole) {
                ForEach(roles, id: \.self) {
                    Text($0.capitalized)
                }
            }
            .pickerStyle(.segmented)

            Button("Sign Up") {
                print("🟦 Button tapped")
                signup(name: name, email: email, password: password, role: selectedRole)
            }
            .buttonStyle(.borderedProminent)

            Button("Already have an account? Log in") {
                showSignup = false
            }
        }
        .padding()
        .alert("Signup Response", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(signupMessage)
        }
    }

    func signup(name: String, email: String, password: String, role: String) {
        guard let url = URL(string: "http://192.168.3.18:3000/signup") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("📤 Sending signup request with:", name, email, password, role)

        let body = [
            "name": name,
            "email": email,
            "password": password,
            "role": role
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    signupMessage = "❌ Invalid server response."
                    showAlert = true
                }
                return
            }

            if httpResponse.statusCode == 409 {
                DispatchQueue.main.async {
                    signupMessage = "⚠️ Email already registered. Please log in instead."
                    showAlert = true
                }
                return
            }

            if httpResponse.statusCode == 200,
               let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let msg = json["message"] as? String {
                DispatchQueue.main.async {
                    signupMessage = msg
                    showAlert = true
                    isLoggedIn = true
                }
            } else {
                DispatchQueue.main.async {
                    signupMessage = "❌ Unexpected error. Status: \(httpResponse.statusCode)"
                    showAlert = true
                }
            }
        }.resume()
    }
}

#Preview {
    SignupView(
        isLoggedIn: .constant(false),
        userRole: .constant("student"),   // ✅ Add this
        showSignup: .constant(true)
    )
}
