//
//  PaynlPaymentLinkCreateResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlPaymentLinkCreateResponse: Codable {
    let url         : String
    let securityMode: Int
}
