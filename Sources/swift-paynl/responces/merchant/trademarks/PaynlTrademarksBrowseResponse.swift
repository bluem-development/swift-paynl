//
//  PaynlTrademarksBrowseResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlTrademarksBrowseResponse: Codable {
    let total     : Int
    let links     : [Link]
    let trademarks: [Trademark]

    enum CodingKeys: String, CodingKey {
        case total
        case trademarks
        case links = "_links"
    }

    struct Trademark: Codable {
        let code      : String
        let name      : String
        let status    : String
        let createdAt : String
        let createdBy : String
        let modifiedAt: String
        let modifiedBy: String
        let deletedAt : String?
        let deletedBy : String?
        let merchant  : Merchant
        let links     : [Link]

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
}
