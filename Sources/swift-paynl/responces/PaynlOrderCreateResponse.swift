//
//  PaynlOrderCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 31.10.24.
//

import Foundation

// MARK: - MainModel
struct PaynlOrderCreateResponse: Codable {
    let id                : String
    let serviceId         : String
    let description       : String
    let reference         : String
    let manualTransferCode: String
    let orderId           : String
    let uuid              : String
    let status            : Status
    let customerKey       : String?
    let receipt           : String?
    let checkoutData      : CheckoutData?
    let integration       : Integration
    let stats             : Stats
    let amount            : Amount
    let authorizedAmount  : Amount
    let capturedAmount    : Amount
    let links             : Links
    let createdBy         : String
    let modifiedBy        : String
    var createdAt         : String  // TODO: Change to `Date`
    var modifiedAt        : String  // TODO: Change to `Date`
    var expiresAt         : String  // TODO: Change to `Date`
    var completedAt       : String? // TODO: Change to `Date?`
    let payments          : [Payment]
    let transferData      : [String: String]
}

// MARK: - Status
struct Status: Codable {
    let code  : Int
    let action: String //TODO: what type should be used for "PENDING"?
    let phase : String?
}

// MARK: - Integration
struct Integration: Codable {
    let test: Bool
}

// MARK: - Stats
struct Stats: Codable {
    let promotorId: Int
    let extra1    : String
    let extra2    : String
    let extra3    : String
    let tool      : String
    let info      : String
    let object    : String
    let domainId  : String
}

// MARK: - Amount
struct Amount: Codable {
    let value   : Int
    let currency: String
}

// MARK: - Links
struct Links: Codable {
    let status  : String
    let abort   : String
    let redirect: String
}

// MARK: - Payment
struct Payment: Codable {
    let id                       : String
    let paymentMethod            : PaymentMethod
    let customerType             : String?
    let customerKey              : String?
    let customerId               : String?
    let customerName             : String?
    let ipAddress                : String
    let status                   : Status
    let currencyAmount           : Amount
    let amount                   : Amount
    let authorizedAmount         : Amount
    let capturedAmount           : Amount
    let supplierData             : String?
    let paymentVerificationMethod: Int
    let secureStatus             : Bool
}

// MARK: - PaymentMethod
struct PaymentMethod: Codable {
    let id   : String
    let input: Input
}

// MARK: - Input
struct Input: Codable {
    let issuerId: String
}

// MARK: - CheckoutData
struct CheckoutData: Codable {
    let customer       : Customer
    let billingAddress : Address
    let shippingAddress: Address
}

// MARK: - Customer
struct Customer: Codable {
    let email      : String
    let firstName  : String
    let lastName   : String
    let gender     : String
    let phone      : String
    let locale     : String
    let ipAddress  : String
    let reference  : String
    let company    : Company
    let dateOfBirth: String
}

// MARK: - Company
struct Company: Codable {
    let name     : String
    let country  : String
    let cocNumber: String
    let vatNumber: String
}

// MARK: - Address
struct Address: Codable {
    let firstName           : String
    let lastName            : String
    let streetName          : String
    let streetNumber        : String
    let zipCode             : String
    let city                : String
    let countryCode         : String
    let regionCode          : String
    let streetNumberAddition: String
}
