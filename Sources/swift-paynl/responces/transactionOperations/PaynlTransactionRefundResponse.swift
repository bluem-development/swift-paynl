//
//  PaynlTransactionRefundResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlTransactionRefundResponse: Codable {
    let orderId             : String
    let transactionId       : String
    let description         : String
    let processDate         : String
    let createdAt           : String
    let createdBy           : String
    let amount              : Amount
    let amountRefunded      : Amount
    let links               : [Link]
    let refundedTransactions: [RefundedTransaction]

    enum CodingKeys: String, CodingKey {
        case orderId
        case transactionId
        case description
        case processDate
        case amount
        case amountRefunded
        case refundedTransactions
        case createdAt
        case createdBy
        case links = "_links"
    }
}

struct RefundedTransaction: Codable {
    let amountRefunded: Amount
    let refund        : Refund
    let createdAt     : String
    let createdBy     : String
}

struct Refund: Codable {
    let id: String
}
