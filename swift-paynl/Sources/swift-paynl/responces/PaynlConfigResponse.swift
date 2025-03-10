//
//  PaynlConfigResponse.swift
//
//
//  Created by Zhanna Hakobyan on 31.10.24.
//

import Foundation

// MARK: - PaynlConfigResponse
struct PaynlConfigResponse: Codable {
    let code            : String
    let secret          : String
    let name            : String
    let status          : String
    let mcc             : Int
    let category        : Category
    let merchant        : Merchant
    let layout          : Layout?
    let tradeName       : Trade
    let address         : Address
    let translations    : Translations
    let createdAt       : String
    let createdBy       : String
    let modifiedAt      : String
    let modifiedBy      : String
    let turnoverGroup   : TurnoverGroup?
    let deletedAt       : String?
    let deletedBy       : String?
    let tguList         : [TGU]
    let links           : [Link]
    let checkoutTexts   : [String]
    let checkoutOptions : [CheckoutOption]
    let checkoutSequence: CheckoutSequence
    let encryptionKeys  : [EncryptionKey]
    let testMode        : Bool

    enum CodingKeys: String, CodingKey {
        case links = "_links"
        case code, secret, testMode, name, translations, status,
             merchant, category, mcc, turnoverGroup, layout, tradeName, address,
             createdAt, createdBy, modifiedAt, modifiedBy, deletedAt, deletedBy,
             checkoutOptions, checkoutSequence, checkoutTexts, encryptionKeys, tguList
    }


    // MARK: - Translation
    struct Translations: Codable {
        let name: [String: String]
    }

    // MARK: - Merchant
    struct Merchant: Codable {
        let code                : String
        let name                : String
        let status              : String // TODO: what type should be used for "ACTIVE"?
        let incorporationCountry: String? // TODO: ... "NL"
    }

    // MARK: - Category
    struct Category: Codable {
        let code: String
        let name: String
    }

    // MARK: - Layout
    struct Layout: Codable {
        let code           : String
        let name           : String
        let icon           : String?
        let cssUrl         : String
        let buttonColor    : String
        let supportingColor: String
        let headerTextColor: String
        let buttonTextColor: String
    }

    // MARK: - Trade
    struct Trade: Codable {
        let code: String
        let name: String
    }

    // MARK: - Address
    struct Address: Codable {
        let code        : String
        let city        : String
        let zipCode     : String
        let streetName  : String
        let countryCode : String
        let streetNumber: String
    }

    // MARK: - CheckoutOption
    struct CheckoutOption: Codable {
        let tag           : String
        let name          : String
        let image         : String
        let translations  : Translations
        let paymentMethods: [PaymentMethod]
        let requiredFields: [RequiredField]?
    }

    // MARK: - PaymentMethod
    struct PaymentMethod: Codable {
        let id          : Int
        let name        : String
        let image       : String
        let options     : [Option]
        let settings    : [Setting]?
        let minAmount   : Int
        let maxAmount   : Int
        let description : String?
        let translations: Translations
    }

    // MARK: - Option
    struct Option: Codable {
        let id   : String
        let name : String
        let image: String
    }

    // MARK: - Setting
    struct Setting: Codable {}

    // MARK: - RequiredField
    struct RequiredField: Codable {
        let fieldName: String
        let mandatory: String
    }

    // MARK: - CheckoutSequence
    struct CheckoutSequence: Codable { // TODO: is countryList("NL", "DE", "BE") dynamic or fixed?
        let `default`: CheckoutCountry
        let nl       : CheckoutCountry?
        let de       : CheckoutCountry?
        let be       : CheckoutCountry?

        enum CodingKeys: String, CodingKey {
            case `default` = "default"
            case nl        = "NL"
            case de        = "DE"
            case be        = "BE"
        }
    }

    // MARK: - CheckoutCountry
    struct CheckoutCountry: Codable {
        let primary  : [String]
        let secondary: [String]
    }

    // MARK: - EncryptionKey
    struct EncryptionKey: Codable {
        let identifier: String
        let publicKey : String
        let createdAt : String // Date
        let expiresAt : String // Date
    }

    // MARK: - TGU
    struct TGU: Codable {
        let id    : Int
        let share : Int
        let domain: String
        let status: String

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case share, domain, status
        }
    }

    // MARK: - TurnoverGroup
    struct TurnoverGroup: Codable {
        let name : String
        let code : String
    }
}

// MARK: - Link
struct Link: Codable {
    let rel : String
    let href: String
    let type: String
}
