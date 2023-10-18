//
//  Network.swift
//  Instagram
//
//  Created by Khai on 2023/10/16.
//

import Foundation

final class Network {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func load<T>(_ resource: Resource<T>) async throws -> [ClothInfo] {
        guard let request = resource.urlRequest else { return [] }
        let data = try await URLSession.shared.data(for: request).0
        return try JsonParser.decode(of: data, to: [ClothInfo].self)
    }
}

public enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case responseError(status: Int)
    case decodingError(error: Error)
    case connectionError
}
