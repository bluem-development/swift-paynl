//
//  PaynlTransactionContext.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 24.05.25.
//

import Foundation

public class PaynlTransactionContext {

    private var token: String

    public init(token: String) { self.token = token }

    public func create(transaction: PaynlTransactionRequest) async -> PaynlTransactionCreateResponse? {
        let urlString = PaynlConstants.baseURL + PaynlConstants.transactionsEndpoint
        let url       = URL(string: urlString)!

        do {
            let headers  = PaynlNetworkService.Constants.apiHeaders(with: token)
            let response = try await PaynlNetworkService.shared.requestAsync(
                                     PaynlTransactionCreateResponse.self, url: url, method: .post,
                                     headers: headers, body: transaction.jsonDictionaryRepresentation)
            return response
        }
        catch { return nil }
    }

    public func statusCheck(for transactionID: String) async -> PaynlTransactionInfoResponse? {
        let urlString = PaynlConstants.baseURL + PaynlConstants.transactionsEndpoint + "/" + transactionID + "/status"
        let url       = URL(string: urlString)!
        
        do {
            let headers  = PaynlNetworkService.Constants.apiHeaders(with: token)
            let response = try await PaynlNetworkService.shared.requestAsync(
                                     PaynlTransactionInfoResponse.self, url: url, headers: headers)
            return response
        }
        catch { return nil }
    }
}
