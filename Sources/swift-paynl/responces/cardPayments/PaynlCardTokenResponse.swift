//
//  PaynlCardTokenResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlCardTokenResponse
struct PaynlCardTokenResponse: Codable {
    let request  : Request
    let binInfo  : BinInfo
    let cardToken: CardToken

    // MARK: - Request
    struct Request: Codable {
        let result        : String
        let errorId       : String
        let errorTag      : String
        let errorMessage  : String
        let errorFieldName: String
    }

    // MARK: - CardToken
    struct CardToken: Codable {
        let token: String
    }

    // MARK: - BinInfo
    struct BinInfo: Codable {
        let anonymous   : String
        let bankId      : String
        let brandCode   : String
        let brandName   : String
        let cardType    : String
        let countryCode : String
        let fundType    : String
        let scheme      : String
        let brandProduct: String
        let brands      : [String]
    }
}
