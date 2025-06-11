//
//  StudentDashboardView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/24/25.
//

import SwiftUI

struct StudentDashboardView: View {
    let requests = [
        FundingRequest(id: 1, amount: 1000, purpose: "Books", status: "Pending"),
        FundingRequest(id: 2, amount: 750, purpose: "Laptop", status: "Approved"),
        FundingRequest(id: 3, amount: 500, purpose: "Bus Pass", status: "Rejected")
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("📚 Welcome, Student")
                    .font(.title2)
                    .padding(.top)

                Text("Your Requests:")
                    .font(.headline)

                List(requests) { request in
                    VStack(alignment: .leading) {
                        Text("\(request.purpose) - $\(request.amount)")
                            .font(.headline)
                        Text("Status: \(request.status)")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Student Dashboard")
        }
    }
}


