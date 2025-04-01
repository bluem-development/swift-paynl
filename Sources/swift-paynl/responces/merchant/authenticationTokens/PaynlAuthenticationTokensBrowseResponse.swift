//
//  PaynlAuthenticationTokensBrowseResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlAuthenticationTokensBrowseResponse: Codable {
    let total                            : Int
    let links                            : [Link]
    private(set) var authenticationTokens: [AuthenticationToken]

    enum CodingKeys: String, CodingKey {
        case total
        case authenticationTokens
        case links = "_links"
    }
}

extension PaynlAuthenticationTokensBrowseResponse {
    internal mutating func validAuthenticationTokens() -> [AuthenticationToken]? {

        let authenticationTokens = authenticationTokens
        guard !authenticationTokens.isEmpty else { return nil }

        let validTokens = authenticationTokens.filter { obj in
            if obj.merchant.status != "ACTIVE" { return false }
            guard obj.deletedAt == nil else { return false }

            return true
        }
        self.authenticationTokens = validTokens

        return validTokens
    }
}

struct AuthenticationToken: Codable {
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
    let links     : [Link]?
}
