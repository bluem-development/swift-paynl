//
//  PaynlEnvironmentContext.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 05.03.25.
//

import Foundation

class PaynlEnvironmentContext {

    //    Configuration:
    //    - Url: `https://rest.pay.nl/v2/services/config`
    //    - Method: `GET`
    //    - Status: `200`

    func fetchConfiguration() async -> PaynlConfigResponse? {
        let url = URL(string: "https://rest.pay.nl/v2/services/config")!

        do {
            guard let serviceId = PaynlConnectionContext.shared.serviceId
            else { return nil }

            guard let token = await PaynlConnectionContext.shared.token
            else { return nil }
            let headers = NetworkService.Constants.apiHeaders(with: token)

            let config = try await NetworkService.shared.requestAsync(
                PaynlConfigResponse.self, url: url, headers: headers, body: ["serviceId": serviceId])

            return config
        } catch {
            // print("Config request failed: \(error)")
            return nil
        }
    }
}
