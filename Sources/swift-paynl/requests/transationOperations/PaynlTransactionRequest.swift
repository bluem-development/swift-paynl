//
//  PaynlTransactionRequest.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 04.06.25.
//

import Foundation

// MARK: - PaynlTransactionRequest
public struct PaynlTransactionRequest: Encodable {
    /// The ID of your service. Required if you authenticate with AT-code/token.
    let serviceId: String
    /// Is shown on the statement of the payer.
    let description: String?
    /// Expire date in the correct ISO-8601 (a.k.a. ATOM) notation.
    let expire: String?
    /// The URL where the payer has to be send to after the payment.
    let returnUrl: String
    /// The URL where we exchange the status of a transaction.
    let exchangeUrl: Url?
    /// The amount in cents. Must be greater than or equal to 1.
    /// The currency in ISO-4217 format.
    let amount: Amount
    /// Payment option ID, e.g. 10 for iDEAL. See: services/get/sl-xxxx-xxx.
    /// Sub-ID of the payment option, e.g. bank ID for iDEAL. See: services/get/sl-xxxx-xxx.
    let paymentMethod: PaynlTransactionPaymentMethod?
    /// Represents `customer` object's details.
    let customer: Customer?
    /// Represents `order` object's details.
    let order: Order?
    /// Represents `stats` object's details.
    let stats: Stats?
    /// Represents `notification` object's details.
    let notification: PaynlNotification?
    /// Represents `transferData` object's details.
    let transferData: TransferData?
    /// Indicates if the service is in test mode or not, possible values: false or true
    let integration: Integration?

    public init(serviceId: String,
         description: String? = nil,
         expire: String? = nil,
         returnUrl: String,
         exchangeUrl: Url? = nil,
         amount: Amount,
         paymentMethod: PaynlTransactionPaymentMethod? = nil,
         customer: Customer? = nil,
         order: Order? = nil,
         stats: Stats? = nil,
         notification: PaynlNotification? = nil,
         transferData: TransferData? = nil,
         integration: Integration? = Integration(testMode: true)
    ) {
        self.serviceId     = serviceId
        self.description   = description
        self.expire        = expire
        self.returnUrl     = returnUrl
        self.exchangeUrl   = exchangeUrl
        self.amount        = amount
        self.paymentMethod = paymentMethod
        self.customer      = customer
        self.order         = order
        self.stats         = stats
        self.notification  = notification
        self.transferData  = transferData
        self.integration   = integration
    }
}

public struct PaynlTransactionPaymentMethod: Codable {
    /// Payment option ID, e.g. 10 for iDEAL. See: services/get/sl-xxxx-xxx.
    public let id: String
    /// Sub-ID of the payment option, e.g. bank ID for iDEAL. See: services/get/sl-xxxx-xxx.
    public let subId: String

    public init(id: String, subId: String) {
        self.id = id
        self.subId = subId
    }
}
