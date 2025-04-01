//
//  PaynlMerchantsCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlMerchantsCreateResponse: Codable {
    let merchant: Merchant
    let links   : [Link]

    enum CodingKeys: String, CodingKey {
        case merchant
        case links = "_links"
    }

    struct Merchant: Codable {
        let code                : String
        let status              : String
        let name                : String
        let publicName          : String
        let contactMethods      : String?
        let createdAt           : String
        let createdBy           : String
        let modifiedAt          : String?
        let modifiedBy          : String?
        let deletedAt           : String?
        let deletedBy           : String?
        let postalAddress       : Address
        let visitAddress        : Address
        let service             : Service
        let trademarks          : [Trademark]
        let licenses            : [License]
        let clearingAccounts    : [ClearingAccount]
        let authenticationTokens: [AuthenticationToken]
    }

    struct ClearingAccount: Codable {
        let code  : String
        let status: String
        let method: String
        let iban  : IBAN
    }

    struct Service: Codable {
        let code           : String
        let secret         : String
        let name           : String
        let publication    : String
        let description    : String
        let categoryCode   : String
        let integrationCode: String
    }

    struct AuthenticationToken: Codable {
        let code  : String
        let secret: String
        let name  : String
    }
}

struct License: Codable {
    let code    : String
    let name    : String
    let language: String?
}
