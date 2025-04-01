//
//  PaynlCardInfoResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlCardInfoResponse
struct PaynlCardInfoResponse: Codable {
    let request : Request
    let binInfo : BinInfo
    let cardInfo: CardInfo

    // MARK: - BinInfo
    struct BinInfo: Codable {
        let anonymous   : String
        let bankId      : String
        let scheme      : String
        let brandCode   : String
        let brandName   : String
        let cardType    : String
        let fundType    : String
        let countryCode : String
        let brandProduct: String
    }

    // MARK: - CardInfo
    struct CardInfo: Codable {
        let luhn      : String
        let tdsVersion: String
    }
}
