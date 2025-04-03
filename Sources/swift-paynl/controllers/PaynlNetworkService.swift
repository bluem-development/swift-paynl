//
//  PaynlNetworkService.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 05.03.25.
//

import Foundation

final class PaynlNetworkService {

    static  let shared = PaynlNetworkService()
    private let session: URLSession

    private init(session: URLSession = .shared) { self.session = session }


    func requestAsync<T: Decodable>(
        _ type : T.Type,
        url    : URL,
        method : HTTPMethod        = .get,
        headers: [String: String]? = nil,
        body   : [String: Any]?    = nil
    ) async throws -> T {

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        var requestBody: Data? = nil

        if method == .get, let body = body { components?.queryItems = body.map
                                                       { URLQueryItem(name: $0.key, value: "\($0.value)") } }
        else if let body = body            { requestBody = try JSONSerialization.data(withJSONObject: body) }

        guard let componentsUrl = components?.url else { throw PaynlNetworkError.invalidURL }

        var request                 = URLRequest(url: componentsUrl)
        request.httpMethod          = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody            = requestBody
        request.timeoutInterval     = Constants.timeoutInterval

        let (data, response) = try await session.data(for: request)
        return try handleResponse(data: data, response: response)
    }

    private func handleResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw PaynlNetworkError.invalidResponse
        }
    
        return try JSONDecoder().decode(T.self, from: data)
    }
}

// MARK: - Constants

extension PaynlNetworkService {
    struct Constants {
        static let timeoutInterval: TimeInterval = 10
        static func apiHeaders(with token: String) -> [String: String] {
            [
                "accept": "application/json",
                "authorization": "Basic \(token)"
            ]
        }
    }
}

// MARK: - Support types

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

public enum PaynlNetworkError: Error {
    case invalidResponse
    case invalidURL
}
