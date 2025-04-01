//
//  NetworkService.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 05.03.25.
//

import Foundation

final class NetworkService {

    static  let shared = NetworkService()
    private let session: URLSession

    private init(session: URLSession = .shared) { self.session = session }


    @available(macOS 12.0, iOS 15.0, *)
    func requestAsync<T: Decodable>(
        _ type : T.Type,
        url    : URL,
        method : HTTPMethod        = .get,
        headers: [String: String]? = nil,
        body   : [String: Any]?    = nil
    ) async throws -> T {

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        var requestBody: Data? = nil

        /// There is a difference in body configuration for `get` and other request types
        if method == .get, let body = body {
            components?.queryItems = body.map { URLQueryItem(name: $0.key, value: "\($0.value)") }

//            body.forEach { key, value in
//                components?.queryItems?.append(URLQueryItem(name: key, value: "\(value)"))
//            }
        } else if let body = body {
            requestBody = try JSONSerialization.data(withJSONObject: body)
        }

        guard let componentsUrl = components?.url else {
            throw NetworkError.invalidURL
        }

        var request                 = URLRequest(url: componentsUrl)
        request.httpMethod          = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody            = requestBody
        request.timeoutInterval     = Constants.timeoutInterval

        let (data, response) = try await session.data(for: request)
        return try handleResponse(data: data, response: response)
    }

    /*
    /// Without Async
    func request<T: Decodable>(
        _ url     : URL,
        method    : HTTPMethod        = .get,
        headers   : [String: String]? = nil,
        body      : Data?             = nil,
        completion: @escaping (Result<T, NetworkError>
        ) -> Void) {

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        request.timeoutInterval = Constants.timeoutInterval

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkFailure(error)))
                return
            }

            guard let data = data, let response = response else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let result: T = try self.handleResponse(data: data, response: response)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }
        task.resume()
    }
    */

    private func handleResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        if let json = prettyPrintedJSON(from : data) {
            print(json)
        }
    
        return try JSONDecoder().decode(T.self, from: data)
    }

    // TODO: Delete 
    private func prettyPrintedJSON(from data: Data) -> String? {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
              let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyString = String(data: prettyData, encoding: .utf8) else {
            return nil
        }
        return prettyString
    }
}

// MARK: - Constants

extension NetworkService {
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

enum NetworkError: Error {
    case invalidResponse
    case invalidURL
    case decodingFailed(Error)
    case networkFailure(Error)
}
