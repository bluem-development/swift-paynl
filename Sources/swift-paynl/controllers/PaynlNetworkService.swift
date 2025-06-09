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

    /// Initialises the network service with a given URL session.
    ///
    /// - Parameter session: A `URLSession` instance used for executing network requests.
    private init(session: URLSession = .shared) { self.session = session }


    /// Sends an asynchronous HTTP request and decodes the response into the expected type.
    ///
    /// - Parameters:
    ///   - type:    The `Decodable` type to parse the response into.
    ///   - url:     The API endpoint URL.
    ///   - method:  The HTTP method to use (default is `.get`).
    ///   - headers: Optional HTTP headers to include.
    ///   - body:    Optional request body as a dictionary.
    ///
    /// - Returns: A decoded object of type `T` if the request succeeds.
    ///
    /// - Throws:
    ///   - `PaynlNetworkError.invalidURL` if the provided URL is not valid.
    ///   - `PaynlNetworkError.invalidResponse` if the server response is not valid.
    ///   -   Any decoding or network errors encountered during the request.
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
        request.timeoutInterval     = Constants.timeoutInterval
        request.httpMethod          = method.rawValue
        request.httpBody            = requestBody
        request.allHTTPHeaderFields = headers

        let (data, response) = try await session.data(for: request)
        return try handleResponse(data: data, response: response)
    }

    /// Handles the HTTP response and decodes the returned data into the expected type.
    ///
    /// - Parameters:
    ///   - data:     The raw response data.
    ///   - response: The `URLResponse` object.
    ///
    /// - Returns: A decoded object of type `T`.
    ///
    /// - Throws:
    ///   - `PaynlNetworkError.invalidResponse` if the status code is not between 200 and 299.
    ///   -   Any decoding error from `JSONDecoder`.
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
                "content-type": "application/json",
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
