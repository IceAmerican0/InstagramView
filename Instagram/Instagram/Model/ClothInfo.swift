//
//  ClothInfo.swift
//  Instagram
//
//  Created by 박성준 on 2023/10/16.
//

import Foundation

public struct ClothInfo: Decodable {
    let status: Int
    let data: ClosetData?
}

public struct ClosetData: Decodable, Hashable {
    let list: Body
}

public struct Body: Decodable, Hashable {
    let closets: [Info]
    let temperatureDifference: Int
}

public struct Info: Decodable, Hashable {
    let id: Int
    let name: String
    let shopName: String
    let shopUrl: String
    let imageUrl: String
    let status: String
}
