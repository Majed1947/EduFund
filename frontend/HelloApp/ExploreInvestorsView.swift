//
//  ExploreInvestorsView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import Foundation
import SwiftUI

struct ExploreInvestorsView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Investor A - Tech Focus")
                Text("Investor B - Long Term")
                Text("Investor C - Education Grants")
            }
            .navigationTitle("Explore Investors")
        }
    }
}
