//
//  PaynlTokenisationAddTokenResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlTokenisationAddTokenResponse: Codable {
    #warning("Identical to `PaynlAddTokenResponse`")
    let request: Request
    let token  : Token
}
