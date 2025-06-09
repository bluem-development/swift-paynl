//
//  PaynlEnvironmentContext.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 05.03.25.
//

import Foundation

public class PaynlEnvironmentContext {

    /// Initialises the `PaynlEnvironmentContext` by configuring the shared connection context.
    ///
    /// - Parameter configPath: The path to the configuration file.
    public init(configPath: String = "/configPath") {
        PaynlConnectionContext.configure(from: configPath)
    }

    /// Asynchronously fetches the configuration details from the API.
    ///
    /// - Returns: A `PaynlConfigResponse` if the request is successful, or `nil` on failure.
    public func fetchConfiguration() async -> PaynlConfigResponse? {
        let urlString = PaynlConstants.baseURL + PaynlConstants.configEndpoint
        let url       = URL(string: urlString)!

        do {
            guard let serviceId = PaynlConnectionContext.shared.serviceId
            else { return nil }

            guard let token = await PaynlConnectionContext.shared.token
            else { return nil }
            let headers = PaynlNetworkService.Constants.apiHeaders(with: token)

            let config = try await PaynlNetworkService.shared.requestAsync(
                PaynlConfigResponse.self, url: url, headers: headers, body: ["serviceId": serviceId])

            return config
        }
        catch { return nil }
    }
}
