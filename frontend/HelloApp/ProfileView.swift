//
//  ProfileView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    let role: String
    @AppStorage("isLoggedIn") private var isLoggedIn = true

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("👤 Profile")
                    .font(.largeTitle)
                    .bold()

                Text("Role: \(role.capitalized)")
                    .font(.title3)

                Spacer()

                Button("Logout") {
                    isLoggedIn = false
                }
                .foregroundColor(.red)
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}
