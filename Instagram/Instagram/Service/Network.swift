//
//  Network.swift
//  Instagram
//
//  Created by 박성준 on 2023/10/16.
//

import Foundation
import RxSwift

final class Network {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func load<T>(_ resource: Resource<T>) -> Observable<T> {
        guard let request = resource.urlRequest else {
            return .error(NetworkError.invalidRequest)
        }
        
        return session.rx
            .asObservable()
    }
}

public enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case responseError(status: Int)
    case decodingError(error: Error)
    case connectionError
}
