//
//  MyLoansView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import Foundation
import SwiftUI

struct MyLoansView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Loan #1 - $5,000 - Ongoing")
                Text("Loan #2 - $3,000 - Repaid")
            }
            .navigationTitle("My Loans")
        }
    }
}
