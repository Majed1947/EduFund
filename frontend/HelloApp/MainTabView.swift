//
//  MainTabView.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/31/25.
//

import SwiftUI

struct MainTabView: View {
    let userRole: String

    var body: some View {
        TabView {
            Group {
                if userRole == "student" {
                    StudentHomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }

                    ExploreInvestorsView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Explore")
                        }

                    MyLoansView()
                        .tabItem {
                            Image(systemName: "book")
                            Text("My Loans")
                        }
                } else if userRole == "investor" {
                    InvestorHomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }

                    DiscoverStudentsView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Students")
                        }

                    FundRequestsView()
                        .tabItem {
                            Image(systemName: "tray.and.arrow.down")
                            Text("Requests")
                        }
                }
            }

            // ✅ Profile tab at the end
            ProfileView(role: userRole)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}
