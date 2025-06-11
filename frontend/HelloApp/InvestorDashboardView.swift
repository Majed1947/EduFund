//
//  InvestorDashboardView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/24/25.
//

import SwiftUI

struct InvestorDashboardView: View {
    let openRequests = [
            FundingRequest(id: 10, amount: 1200, purpose: "Final Semester Tuition", status: nil),
            FundingRequest(id: 11, amount: 400, purpose: "Transportation", status: nil),
            FundingRequest(id: 12, amount: 600, purpose: "Lab Equipment", status: nil)
        ]
    

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("💼 Welcome, Investor")
                    .font(.title2)
                    .padding(.top)

                Text("Funding Requests:")
                    .font(.headline)

                List(openRequests) { request in
                    VStack(alignment: .leading) {
                        Text("\(request.purpose) - $\(request.amount)")
                            .font(.headline)
                        Button("Approve") {
                            print("Approved request #\(request.id)")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 4)
                    }
                    .padding(.vertical, 4)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Investor Dashboard")
        }
    }
}


