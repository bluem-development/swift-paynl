//
//  PaynlPayoutCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlPayoutCreateResponse
struct PaynlPayoutCreateResponse: Codable {
    let links      : [Link]
    let transaction: Transaction

    enum CodingKeys: String, CodingKey {
        case transaction
        case links = "_links"
    }
}
