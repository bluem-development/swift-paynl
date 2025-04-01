//
//  PaynlAddTokenResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlAddTokenResponse
struct PaynlAddTokenResponse: Codable {
    let request: Request
    let token  : Token
}

// MARK: - Token
struct Token: Codable {
    let id  : String
    let hash: String
}
