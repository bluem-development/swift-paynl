//
//  PaynlDocumentsAddResponse.swift
//
//
//  Created by Zhanna Hakobyan on 14.11.24.
//

import Foundation

struct PaynlDocumentsAddResponse: Codable {
    let document: Document
    let links   : [Link]

    enum CodingKeys: String, CodingKey {
        case document
        case links = "_links"
    }
}

struct Document: Codable {
    let code  : String
    let type  : String
    let status: String
}
