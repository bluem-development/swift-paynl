//
//  PaynlTrademarksCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlTrademarksCreateResponse: Codable {
    let code: String
    let name: String
    let status: String
    let merchant: Merchant
    let createdAt: String
    let createdBy: String
    let modifiedAt: String?
    let modifiedBy: String?
    let deletedAt: String?
    let deletedBy: String?
    let links: [Link]

    enum CodingKeys: String, CodingKey {
        case code
        case name
        case status
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
