//
//  Encodable+Additions.swift
//  swift-paynl
//
//  Created by Zhanna Hakobyan on 04.06.25.
//

import Foundation

extension Encodable {
    var jsonDictionaryRepresentation: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
    }
}
