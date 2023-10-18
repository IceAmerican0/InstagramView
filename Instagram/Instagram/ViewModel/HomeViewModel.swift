//
//  HomeViewModel.swift
//  Instagram
//
//  Created by Khai on 2023/10/16.
//

import Foundation

final class HomeViewModel {
    let network = Network(configuration: .default)
    
    func loadList() async throws -> [ClothInfo] {
        let resource = Resource<ClothInfo>()
        let clothInfo: [ClothInfo]
        
        do {
            clothInfo = try await Network(configuration: .default).load(resource)
            return clothInfo
        } catch {
            return []
        }
    }
}
