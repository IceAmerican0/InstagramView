//
//  JsonParser.swift
//  Instagram
//
//  Created by Khai on 2023/10/17.
//

import Foundation

enum JsonParserError: Error {
    case decodeError
}

final class JsonParser {
    static func decode<T: Decodable>(of data: Data, to type: T.Type) throws -> T {
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            throw JsonParserError.decodeError
        }
        return decoded
    }
}
