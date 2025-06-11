//
//  FundRequestsView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import Foundation
import SwiftUI

struct FundRequestsView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Request: $2000 - Computer Science")
                Text("Request: $1500 - Engineering Books")
                Text("Request: $1000 - Internship Travel")
            }
            .navigationTitle("Funding Requests")
        }
    }
}
