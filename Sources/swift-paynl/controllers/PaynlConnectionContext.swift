//
//  PaynlConnectionContext.swift
//
//
//  Created by Zhanna Hakobyan on 18.11.24.
//

import Foundation

// TODO: Switch to actor in the future
public class PaynlConnectionContext {
    /*
     Overview

     1. The `token` is mandatory for authenticating API requests
     - API endpoint: https://rest.pay.nl/v2/authenticationtokens
     - The `authenticationtokens` API request returns all authentication tokens (an array of token objects)
     - If a token is requested but all tokens are expired, a new API request must be sent to retrieve and return a valid token

     2. The `serviceId` is mandatory for performing an API call
     - Link: https://my.pay.nl/programs/programs
     - The value of serviceId is retrieved from an external directory. The directory path is passed as an argument to the `PaynlConnectionContext` initializer
     */


    private       var config                 : PaynlConfiguration?
    private       var authenticationResponse : PaynlAuthenticationTokensBrowseResponse?
    public static let shared                 = PaynlConnectionContext()

    public init(configPath: String = "/configPath") {
        self.config = parseConfig(atPath: configPath)
    }

    private func parseConfig(atPath path: String) -> PaynlConfiguration? {
        do    { return try Data.decode(from: path, as: PaynlConfiguration.self) }
        catch { return nil }
    }

    internal func fetchTokens() async -> PaynlAuthenticationTokensBrowseResponse? {
        let url = URL(string: "https://rest.pay.nl/v2/authenticationtokens")!

        do {
            guard let merchantId = self.merchantId
            else { return nil }

            guard let config = config
            else { return nil }

            let token   = createToken(secretCode: config.secret, tokenCode: config.tokenCode)
            let headers = PaynlNetworkService.Constants.apiHeaders(with: token)

            let resp = try await PaynlNetworkService.shared.requestAsync(
                PaynlAuthenticationTokensBrowseResponse.self, url: url, headers: headers, body: ["merchantId": merchantId])

            return resp
        } catch {
            // print("PaynlAuthenticationTokens request failed: \(error)")
            return nil
        }
    }
}

// MARK: - PaynlConnectionContextProtocol
public protocol PaynlConnectionContextProtocol {
    var serviceId : String? { get }
    var merchantId: String? { get }
    var token     : String? { get async }
}

extension PaynlConnectionContext: PaynlConnectionContextProtocol {
    public var serviceId:  String? { self.config?.serviceId  }
    public var merchantId: String? { self.config?.merchantId }

    public var token: String? {
        get async {

            /// Check if the array has valid authenticationTokens objects
            guard let object = self.authenticationResponse?.validAuthenticationTokens()?.first
            else {
                /// Load array of authenticationTokens, find valid objects, create a token and return it
                self.authenticationResponse = await fetchTokens()
                if let object = self.authenticationResponse?.validAuthenticationTokens()?.first {
                    let token = createToken(secretCode: object.secret, tokenCode: object.code)
                    return token
                }

                return nil
            }

            /// Create a token form valid authenticationToken object
            let token = createToken(secretCode: object.secret, tokenCode: object.code)
            return token
        }
    }

    private func createToken(secretCode: String, tokenCode: String) -> String {
        Data("\(tokenCode):\(secretCode)".utf8).base64EncodedString()
    }
}

// MARK: - PaynlConfiguration
private struct PaynlConfiguration: Codable {
    let secret    : String
    let tokenCode : String
    let serviceId : String
    let merchantId: String
}
