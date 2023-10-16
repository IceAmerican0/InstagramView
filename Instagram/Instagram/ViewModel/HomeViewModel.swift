//
//  HomeViewModel.swift
//  Instagram
//
//  Created by 박성준 on 2023/10/16.
//

import Foundation

final class HomeViewModel {
    let network = Network(configuration: .default)
    
    func loadList() {
        let resource = Resource<ClothInfo>()
        
        network.load(resource)
    }
}
