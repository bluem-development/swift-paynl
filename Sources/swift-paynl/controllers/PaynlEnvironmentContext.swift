//
//  PaynlEnvironmentContext.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 05.03.25.
//

import Foundation

public class PaynlEnvironmentContext {

    public init(configPath: String = "/configPath") {
        PaynlConnectionContext.configure(from: configPath)
    }

    public func fetchConfiguration() async -> PaynlConfigResponse? {
        let url = URL(string: "https://rest.pay.nl/v2/services/config")!

        do {
            guard let serviceId = PaynlConnectionContext.shared.serviceId
            else { return nil }

            guard let token = await PaynlConnectionContext.shared.token
            else { return nil }
            let headers = PaynlNetworkService.Constants.apiHeaders(with: token)

            let config = try await PaynlNetworkService.shared.requestAsync(
                PaynlConfigResponse.self, url: url, headers: headers, body: ["serviceId": serviceId])

            return config
        } catch {
            return nil
        }
    }
}
