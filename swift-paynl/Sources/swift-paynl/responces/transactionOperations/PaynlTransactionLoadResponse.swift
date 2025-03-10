//
//  PaynlTransactionLoadResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

struct PaynlTransactionLoadResponse: Codable {
    let id         : String
    let orderId    : String
    let serviceCode: String
    let description: String
    let reference  : String
    let ipAddress  : String
    let returnUrl  : String
    let status     : Status
    let expiresAt  : String
    let createdAt  : String
    let createdBy  : String
    let modifiedAt : String?
    let modifiedBy : String?
    let deletedAt  : String?
    let deletedBy  : String?
    let amount     : Amount
    let integration: Integration
    let merchant   : Merchant
    let tradeName  : TradeName
    let layout     : Layout
    let links      : [Link]

    enum CodingKeys: String, CodingKey {
        case id
        case orderId
        case serviceCode
        case description
        case reference
        case ipAddress
        case returnUrl
        case amount
        case status
        case integration
        case merchant
        case tradeName
        case layout
        case expiresAt
        case createdAt
        case createdBy
        case modifiedAt
        case modifiedBy
        case deletedAt
        case deletedBy
        case links = "_links"
    }
}

struct Merchant: Codable {
    let code                : String
    let name                : String
    let status              : String
    let incorporationCountry: String?
}

struct TradeName: Codable {
    let code: String
    let name: String
}

struct Layout: Codable {
    let code           : String
    let name           : String
    let cssUrl         : String
    let icon           : String
    let buttonColor    : String
    let supportingColor: String
    let headerTextColor: String
    let buttonTextColor: String
}
