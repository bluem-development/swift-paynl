//
//  PaynlVoucherCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlVoucherCreateResponse
struct PaynlVoucherCreateResponse: Codable {
    let ref: String

    enum CodingKeys: String, CodingKey {
        case ref = "$ref"
    }
}
