//
//  PaynlAuthenticationStatusResponse.swift
//
//
//  Created by Zhanna Hakobyan on 04.11.24.
//

import Foundation

// MARK: - PaynlAuthenticationStatusResponse
struct PaynlAuthenticationStatusResponse: Codable {
    let request: Request
    let threeDs: ThreeDs
}

// MARK: - ThreeDs
struct ThreeDs: Codable {
    let transactionID        : String
    let nextAction           : String
    let transactionStatusCode: String
    let challengeType        : String?
    let challengeForm        : String?
    let challengeFullScreen  : String?
    let challengeWindowWidth : String?
    let challengeWindowHeight: String?
    let tdsApiURLStatus      : String?
    let tdsMode              : String?
    let acquirerID           : String?
    let checkStatusInterval  : String?
    let challengeValidUntil  : String?
    let threeDSMethodURL     : String?
    let threeDSMethodData    : String?
}

// MARK: - Request
struct Request: Codable {
    let result      : String
    let errorId     : String
    let errorTag    : String
    let errorMessage: String
}

