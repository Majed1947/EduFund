//
//  DiscoverStudentsView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import Foundation
import SwiftUI

struct DiscoverStudentsView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Sara - KSU - Finance Major")
                Text("Majed - ASU - Computer Science")
                Text("Lina - KAUST - Biomedical Eng")
            }
            .navigationTitle("Discover Students")
        }
    }
}
