//
//  PaynlAuthenticationTokensCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlAuthenticationTokensCreateResponse: Codable {
    let code      : String
    let secret    : String
    let name      : String
    let createdAt : String
    let createdBy : String
    let modifiedAt: String?
    let modifiedBy: String?
    let deletedAt : String?
    let deletedBy : String?
    let merchant  : Merchant
    let links     : [Link]

    enum CodingKeys: String, CodingKey {
        case code
        case secret
        case name
        case merchant
        case createdAt
        case createdBy
        case modifiedAt
        case modifiedBy
        case deletedAt
        case deletedBy
        case links = "_links"
    }
}
