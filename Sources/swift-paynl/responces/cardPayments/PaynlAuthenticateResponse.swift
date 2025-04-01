//
//  PaynlAuthenticateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 04.11.24.
//

import Foundation

// MARK: - PaynlAuthenticateResponse
struct PaynlAuthenticateResponse: Codable {
    let request: Request
    let payment: Payment?
    let threeDs: ThreeDs?

    // MARK: - Payment
    struct Payment: Codable {
        let bankCode           : String
        let bankMessage        : String
        let approvalCode       : String
        let cvcCheck           : String
        let threeDs            : String
        let avsResult          : String
        let schemeTransactionId: String
    }

    // MARK: - Transaction
    struct Transaction: Codable {
        let transactionId       : String
        let orderId             : String
        let paymentProfileId    : String
        let state               : String
        let stateName           : String
        let amount              : Amount
        let identifierName      : String
        let identifierPublic    : String
        let identifierHash      : String
        let startIpAddress      : String
        let completedIpAddress  : String
        let orderNumber         : String
        let amountOriginal      : Amount
        let amountPaidOriginal  : Amount
        let amountPaid          : Amount
        let amountRefundOriginal: Amount
        let amountRefund        : Amount
        let entranceCode        : String
        let created             : Int
    }
}
