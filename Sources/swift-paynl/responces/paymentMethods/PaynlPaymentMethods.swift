//
//  PaynlPaymentMethods.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 04.06.25.
//

import Foundation

public struct PaynlPaymentMethodResponse: Codable {
    let total         : Int
    let paymentMethods: [PaymentMethod]

    struct PaymentMethod: Codable {
        let id             : Int?
        let name           : String?
        let description    : String?
        let sequence       : Int?
        let `public`       : Bool?
        let status         : String?
        let image          : String?
        let translations   : Translations?
        let targetCountries: [String]?
        let paymentProfiles: [PaymentProfile]?
        let createdAt      : String?
        let modifiedAt     : String?
        let deletedAt      : String?
    }
}

struct Translations: Codable {
    let name       : [String: String]?
    let description: [String: String]?
    let publicName : [String: String]?
}

struct PaymentProfile: Codable {
    let id                : Int
    let name              : String?
    let publicName        : String?
    let `public`          : Bool?
    let selectable        : Bool?
    let paymentMethodGroup: String?
    let paymentType       : String?
    let customerIdType    : String?
    let riskCategory      : String?
    let translations      : Translations?
    let issuers           : [Issuer]?
    let categories        : [Category]?
    let createdAt         : String?
    let modifiedAt        : String?
    let deletedAt         : String?
}

struct Issuer: Codable {
    let id  : String
    let code: String
    let name: String
}
