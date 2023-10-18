//
//  Resource.swift
//  Instagram
//
//  Created by Khai on 2023/10/16.
//

import Foundation

public struct Resource<T: Decodable> {
    var base: String
    var path: String
    var params: [String: String]
    var header: [String: String]
    var urlRequest: URLRequest? {
        var components = URLComponents(string: base + path)!
        let query = params.map { (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        }
        components.queryItems = query
        
        var request = URLRequest(url: components.url!)
        header.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    init(base: String = "",
         path: String = "",
         params: [String : String] = ["dateTime": "\(Date().now)"],
         header: [String : String] = ["Content-Type": "application/json"]) {
        self.base = base
        self.path = path
        self.params = params
        self.header = header
    }
}
