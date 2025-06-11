//
//  InvestorHomeView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import Foundation
import SwiftUI

struct InvestorHomeView: View {
    var body: some View {
        VStack {
            Text("Welcome, Investor!")
                .font(.title)

            Text("You can view student requests, manage loans, and explore opportunities.")
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationTitle("Home")
    }
}
