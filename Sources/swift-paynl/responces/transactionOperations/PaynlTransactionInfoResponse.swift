//
//  PaynlTransactionInfoResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

struct PaynlTransactionInfoResponse: Codable {
    let id             : String
    let orderId        : String
    let serviceCode    : String
    let description    : String
    let reference      : String
    let ipAddress      : String
    let status         : Status
    let expiresAt      : String
    let createdAt      : String
    let createdBy      : String
    let modifiedAt     : String?
    let modifiedBy     : String?
    let deletedAt      : String?
    let deletedBy      : String?
    let amount         : Amount
    let amountConverted: Amount
    let amountPaid     : Amount
    let amountRefunded : Amount
    let paymentData    : PaymentData
    let paymentMethod  : PaymentMethod
    let customer       : Customer
    let order          : Order
    let stats          : Stats
    let transferData   : [String]
    let links          : [Link]

    enum CodingKeys: String, CodingKey {
        case id
        case orderId
        case serviceCode
        case description
        case reference
        case ipAddress
        case amount
        case amountConverted
        case amountPaid
        case amountRefunded
        case status
        case paymentData
        case paymentMethod
        case customer
        case order
        case stats
        case transferData
        case expiresAt
        case createdAt
        case createdBy
        case modifiedAt
        case modifiedBy
        case deletedAt
        case deletedBy
        case links = "_links"
    }

    struct PaymentData: Codable {
        let method                   : String
        let customerKey              : String
        let customerId               : String
        let customerName             : String
        let ipAddress                : String
        let paymentVerificationMethod: Int
        let iban                     : IBAN
        let secureStatus             : Bool
    }

    struct PaymentMethod: Codable {
        let id   : Int
        let subId: Int
        let name : String
    }

    struct Customer: Codable {
        let firstName  : String
        let lastName   : String
        let type       : String
        let birthDate  : String
        let language   : String
        let gender     : String
        let phone      : String
        let email      : String
        let reference  : String
        let trust      : Int
        let company    : Company
        let bankAccount: BankAccount
    }

    struct BankAccount: Codable {
        let iban : String
        let bic  : String
        let owner: String
    }

    struct Company: Codable {
        let name       : String
        let coc        : String
        let vat        : String
        let countryCode: String
    }

    struct Order: Codable {
        let countryCode    : String
        let deliveryDate   : String
        let invoiceDate    : String
        let deliveryAddress: Address
        let invoiceAddress : Address
        let products       : [Product]
    }

    struct Address: Codable {
        let firstName            : String
        let lastName             : String
        let streetName           : String
        let streetNumber         : Int
        let zipCode              : String
        let city                 : String
        let regionCode           : String
        let countryCode          : String
        let streetNumberExtension: String
    }

    struct Product: Codable {
        let id         : String
        let type       : String
        let price      : Amount
        let quantity   : Int
        let vatCode    : String
        let description: String
    }

    struct Stats: Codable {
        let info    : String
        let tool    : String
        let object  : String
        let extra1  : String
        let extra2  : String
        let extra3  : String
        let domainId: String?
    }
}
