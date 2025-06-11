//
//  FundingRequest.swift
//  HelloApp
//
//  Created by Majed Ghasib on 5/25/25.
//

import Foundation

struct FundingRequest: Identifiable {
    let id: Int
    let amount: Int
    let purpose: String
    let status: String?  // Make status optional if investor doesn't use it
}
