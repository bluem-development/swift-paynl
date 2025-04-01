//
//  PaynlAuthenticateLoginResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlAuthenticateLoginResponse: Codable {
    let session: Session
    let links  : [Link]

    enum CodingKeys: String, CodingKey {
        case session
        case links = "_links"
    }
}

struct Session: Codable {
    let sessionCode: String
    let handshake  : String
    let internalId : String
    let licenseCode: String
    let redirectUrl: String
}
