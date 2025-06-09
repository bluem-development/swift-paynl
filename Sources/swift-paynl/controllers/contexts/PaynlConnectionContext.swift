//
//  PaynlConnectionContext.swift
//
//
//  Created by Zhanna Hakobyan on 18.11.24.
//

import Foundation

public class PaynlConnectionContext {
    private        var config                 : PaynlConfiguration?
    private        var authenticationResponse : PaynlAuthenticationTokensBrowseResponse?
    private static var instance               : PaynlConnectionContext?

    /// Provides access to the shared singleton instance.
    ///
    /// - Returns: The initialised shared instance of `PaynlConnectionContext`.
    public static var shared: PaynlConnectionContext {
        guard let instance = instance
        else  { fatalError("The PaynlConnectionContext.shared accessed before initialisation.") }

        return instance
    }

    /// Configures and initialises the shared singleton context.
    ///
    /// - Parameter path: The path to the configuration file.
    public static func configure(from path: String = "/configPath") {
        guard instance == nil else { return }

        let config = parseConfig(atPath: path)
        instance   = PaynlConnectionContext(config: config)
    }

    /// Initialises the context with a given configuration.
    ///
    /// - Parameter config: The loaded `PaynlConfiguration` object.
    private init(config: PaynlConfiguration?) {
        self.config = config
    }

    /// Parses the configuration file from a given path.
    ///
    /// - Parameter path: The file path to the configuration.
    /// - Returns: A decoded `PaynlConfiguration` object, or `nil` if decoding fails.
    private static func parseConfig(atPath path: String) -> PaynlConfiguration? {
        do    { return try Data.decode(from: path, as: PaynlConfiguration.self) }
        catch { return nil }
    }

    /// Asynchronously fetches authentication tokens from the API.
    ///
    /// - Returns: A `PaynlAuthenticationTokensBrowseResponse` if successful, or `nil` on failure.
    internal func fetchTokens() async -> PaynlAuthenticationTokensBrowseResponse? {
        let urlString = PaynlConstants.baseURL + PaynlConstants.authTokensEndpoint
        let url       = URL(string: urlString)!

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
        }
        catch { return nil }
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


    /// Asynchronously provides a valid authorisation token.
    ///
    /// This property checks if there is already a valid authentication token available.
    /// If not, it will attempt to fetch new tokens from the server, generate the token, and return it.
    ///
    /// - Returns: A Base64-encoded token string if successful, or `nil` if token generation fails.
    public var token: String? {
        get async {

            guard let object = self.authenticationResponse?.validAuthenticationTokens()?.first
            else {
                self.authenticationResponse = await fetchTokens()
                if let object = self.authenticationResponse?.validAuthenticationTokens()?.first {
                    let token = createToken(secretCode: object.secret, tokenCode: object.code)
                    return token
                }

                return nil
            }

            let token = createToken(secretCode: object.secret, tokenCode: object.code)
            return token
        }
    }

    /// Generates a Base64-encoded token string using the provided secret and token code.
    ///
    /// - Parameters:
    ///   - secretCode: The `secretCode` used for token generation.
    ///   - tokenCode:  The `tokenCode` used for token generation.
    /// - Returns: A Base64-encoded token string.
    func createToken(secretCode: String, tokenCode: String) -> String {
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
