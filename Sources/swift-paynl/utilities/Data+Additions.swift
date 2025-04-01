//
//  Data+Additions.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 05.12.24.
//

import Foundation

extension Data {

    public static func decode<T: Decodable>(from path: String, as type: T.Type) throws -> T {
        guard FileManager.default.fileExists(atPath: path) else {
            throw NSError(domain: "FileError", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found at path \(path)"])
        }

        let json = try Data(contentsOf: URL(fileURLWithPath: path))
        let data = try JSONDecoder().decode(T.self, from: json)

        return data
    }
}
