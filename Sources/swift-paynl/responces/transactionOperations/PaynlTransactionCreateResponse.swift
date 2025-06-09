//
//  PaynlTransactionCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 31.10.24.
//

import Foundation

// MARK: - PaynlTransactionCreateResponse
public struct PaynlTransactionCreateResponse: Codable {
    let id                : String?
    let serviceId         : String?
    let description       : String?
    let reference         : String?
    let manualTransferCode: String
    let orderId           : String?
    let uuid              : String
    let status            : Status?
    let customerKey       : String?
    let receipt           : String?
    let checkoutData      : CheckoutData?
    let integration       : Integration?
    let stats             : Stats?
    let amount            : Amount
    let authorizedAmount  : Amount?
    let capturedAmount    : Amount?
    let links             : Links?
    let createdBy         : String
    let modifiedBy        : String
    var createdAt         : String  // TODO: Change to `Date`
    var modifiedAt        : String  // TODO: Change to `Date`
    var expiresAt         : String  // TODO: Change to `Date`
    var completedAt       : String? // TODO: Change to `Date?`
    let payments          : [Payment]?
    let transferData      : [String: String]?
    let paymentUrl        : String?
    let statusUrl         : String?
    let orderStatusUrl    : String?
    let hash              : String?
    let cancelUrl         : String?
    let expire            : Int?
    let created           : String?
    let modified          : String?
    let _links            : [Link]?
}

// MARK: - Status
public struct Status: Codable {
    let code  : Int
    let action: String //TODO: what type should be used for "PENDING"?
    let phase : String?
}

// MARK: - Integration
struct Integration: Codable {
    let testMode: Bool
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
public struct Amount: Codable {
    let value   : Int
    let currency: String

    public init(value: Int, currency: String) {
        self.value    = value
        self.currency = currency
    }
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
    /// The forename (also known as a given name, Christian name or a first name). Length between 1 and 64.
    let firstName  : String
    /// The surname (also known as a family name or a last name).  Length between 1 and 64.
    let lastName   : String
    /// The subject's gender. Choose either M for male or F for female.
    let gender     : String
    /// The subject's phone number. Optionally prepended with a + and country code.
    let phone      : String
    let locale     : String?
    /// An ip address.
    let ipAddress  : String
    /// Unique reference of the payer. This field only allows alphanumeric characters.
    let reference  : String
    /// Represents `company` object's details.
    let company    : Company
    /// Date of birth as defined in ISO-8601.
    let dateOfBirth: Date

    enum CodingKeys: String, CodingKey {
        case dateOfBirth = "birthDate"
        case email, firstName, lastName,  gender, locale,
             phone, ipAddress, reference, company
    }
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

// MARK: - TransferData
struct TransferData: Codable {
    /// The name of the variable to be tracked in the transaction.
    let name : String
    /// The value of the variable to be tracked in the transaction.
    let value: String
}

// MARK: - PaynlNotification
struct PaynlNotification: Codable {
    /// Use "push" for push messages, or "email" to send out an email.
    let type: String
    /// The recipient of the notification. For push messages, use your device id (AD-XXXX-XXXX). For email, provide a valid email address (XXXX@XXXX.XX).
    let recipient: String
}
