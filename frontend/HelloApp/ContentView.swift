//
//  ContentView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 4/19/25.
//
import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var userRole = ""
    @State private var showSignup = false

    var body: some View {
        NavigationStack {
            if isLoggedIn {
                // 🎯 Show the dynamic tabbed interface based on role
                MainTabView(userRole: userRole)
            } else {
                if showSignup {
                    SignupView(isLoggedIn: $isLoggedIn, userRole: $userRole, showSignup: $showSignup)
                } else {
                    LoginView(isLoggedIn: $isLoggedIn, userRole: $userRole, showSignup: $showSignup)
                }
            }
        }
    }
}
