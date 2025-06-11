//
//  StudentHomeView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import Foundation
import SwiftUI

struct StudentHomeView: View {
    var body: some View {
        VStack {
            Text("Welcome, Student!")
                .font(.title)

            Text("You can now apply for funding, view your profile, or track your loans.")
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationTitle("Home")
    }
}
