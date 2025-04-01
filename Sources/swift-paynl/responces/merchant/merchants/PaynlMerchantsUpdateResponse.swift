//
//  PaynlMerchantsUpdateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlMerchantsUpdateResponse: Codable {
    let code            : String
    let name            : String
    let publicName      : String
    let boardingStatus  : String
    let status          : String
    let payoutStatus    : String
    let coc             : String
    let vat             : String
    let companyTypeId   : String
    let countryCode     : String
    let contractLanguage: String
    let contractPackage : String
    let contactPhone    : String
    let contactEmail    : String
    let website         : String
    let createdAt       : String
    let createdBy       : String
    let acceptedAt      : String
    let reviewedAt      : String
    let nextReviewDate  : String
    let suspendedAt     : String?
    let suspendedBy     : String?
    let modifiedAt      : String?
    let modifiedBy      : String?
    let deletedAt       : String?
    let deletedBy       : String?
    let postalAddress   : Address
    let visitAddress    : Address
    let partner         : [Partner]
    let links           : [Link]

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
        case contactPhone
        case contactEmail
        case website
        case postalAddress
        case visitAddress
        case partner
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
}
