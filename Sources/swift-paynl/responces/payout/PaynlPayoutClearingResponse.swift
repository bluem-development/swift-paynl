//
//  PaynlPayoutClearingResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlPayoutClearingResponse
struct PaynlPayoutClearingResponse: Codable {
    let links      : [Link]
    let transaction: Transaction
}

// MARK: - Transaction
struct Transaction: Codable {
    let id         : String
    let orderId    : String
    let serviceId  : String
    let reference  : String
    let created    : String
    let modified   : String
    let description: String
    let amount     : Amount
}
