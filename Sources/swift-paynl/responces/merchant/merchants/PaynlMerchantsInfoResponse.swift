//
//  PaynlMerchantsInfoResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlMerchantsInfoResponse: Codable {
    let code                : String
    let name                : String
    let publicName          : String
    let boardingStatus      : String
    let status              : String
    let payoutStatus        : String
    let coc                 : String
    let vat                 : String
    let companyTypeId       : String
    let countryCode         : String
    let contractLanguage    : String
    let contractPackage     : String
    let accountManager      : String?
    let website             : String
    let createdAt           : String
    let createdBy           : String
    let acceptedAt          : String?
    let suspendedAt         : String?
    let suspendedBy         : String?
    let modifiedAt          : String?
    let modifiedBy          : String?
    let deletedAt           : String?
    let deletedBy           : String?
    let reviewedAt          : String
    let nextReviewDate      : String
    let links               : [Link]
    let categories          : [Category]
    let integrations        : [Integration]
    let clearingAccounts    : [ClearingAccount]
    let postalAddress       : Address
    let visitAddress        : Address
    let contactMethods      : [ContactMethod]
    let trademarks          : [Trademark]
    let licenses            : [License]
    let services            : [Service]
    let partner             : [Partner]
    let documents           : [Document]
    let authenticationTokens: [AuthenticationToken]

    enum CodingKeys: String, CodingKey {
        case code
        case name
        case publicName
        case boardingStatus
        case status
        case payoutStatus
        case coc
        case vat
        case companyTypeId
        case countryCode
        case contractLanguage
        case contractPackage
        case accountManager
        case website
        case categories
        case integrations
        case clearingAccounts
        case postalAddress
        case visitAddress
        case contactMethods
        case authenticationTokens
        case trademarks
        case licenses
        case services
        case partner
        case documents
        case createdAt
        case createdBy
        case acceptedAt
        case suspendedAt
        case suspendedBy
        case modifiedAt
        case modifiedBy
        case deletedAt
        case deletedBy
        case reviewedAt
        case nextReviewDate
        case links = "_links"
    }

    struct Integration: Codable {
        let code: String
        let name: String
    }

    struct License: Codable {
        let code     : String
        let name     : String
        let language : String
        let documents: [Document]
    }

    struct Document: Codable {
        let code        : String
        let type        : String
        let status      : String
        let name        : String
        let description : String
        let createdAt   : String
        let createdBy   : String
        let acceptedAt  : String?
        let modifiedAt  : String?
        let modifiedBy  : String?
        let deletedAt   : String?
        let deletedBy   : String?
        let translations: [String: [String: String]]
    }
}

struct Category: Codable {
    let code: String
    let name: String
}

struct ClearingAccount: Codable {
    let code  : String
    let status: String
    let method: String
    let iban  : IBAN
}

struct IBAN: Codable {
    let bic  : String
    let iban : String
    let owner: String
}

struct ContactMethod: Codable {
    let code         : String
    let type         : String
    let value        : String
    let description  : String
    let notifications: Bool
    let `public`     : Bool
}

struct Trademark: Codable {
    let code  : String
    let type  : String
    let name  : String
    let status: String
}

struct Service: Codable {
    let code       : String
    let name       : String
    let secret     : String
    let status     : String
    let website    : String
    let category   : Category
    let integration: Integration
    let urls       : [Url]
}

struct Url: Codable {
    let code   : String
    let website: String
}
