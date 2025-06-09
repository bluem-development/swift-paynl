//
//  PaynlPaymentMethodsContext.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 04.06.25.
//

import Foundation

public class PaynlPaymentMethodsContext {

    private var token: String

    public init(token: String) { self.token = token }

    public func fetchPaymentMethods() async -> PaynlPaymentMethodResponse? {
        let urlString = PaynlConstants.baseURL + PaynlConstants.paymentMethodsEndpoint
        let url       = URL(string: urlString)!

        do {
            let headers  = PaynlNetworkService.Constants.apiHeaders(with: token)
            let response = try await PaynlNetworkService.shared.requestAsync(
                                     PaynlPaymentMethodResponse.self, url: url, headers: headers)
            return response
        }
        catch { return nil }
    }
}
