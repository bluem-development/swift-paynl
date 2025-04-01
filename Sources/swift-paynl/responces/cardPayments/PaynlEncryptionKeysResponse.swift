//
//  PaynlEncryptionKeysResponse.swift
//
//
//  Created by Zhanna Hakobyan on 04.11.24.
//

import Foundation

// MARK: - PaynlEncryptionKeysResponse
struct PaynlEncryptionKeysResponse: Codable {
    let request: Request
    let keys   : [Key]

    // MARK: - Key
    struct Key: Codable {
        let identifier: String
        let publicKey : String
        let createdAt : String
        let expiresAt : String

        enum CodingKeys: String, CodingKey {
            case identifier
            case publicKey = "public_key"
            case createdAt = "created_at"
            case expiresAt = "expires_at"
        }
    }
}
