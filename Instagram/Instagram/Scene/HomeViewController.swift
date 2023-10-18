//
//  HomeViewController.swift
//  Instagram
//
//  Created by Khai on 2023/10/16.
//

import UIKit
import FlexLayout
import PinLayout
import Then

class HomeViewController: UIViewController {
    
    let container = UIView()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.delegate = self
        $0.register(InstagramCollectionViewCell.self, forCellWithReuseIdentifier: "InstagramCollectionViewCell")
    }
    
    let viewModel = HomeViewModel()
    var loadedData: [ClothInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(container)
        
        bind()
    }
    
    override func viewDidLayoutSubviews() {
        container.pin.all(view.pin.safeArea)
        container.flex.layout()
        
        buildLayouts()
    }
    
    private func buildLayouts() {
        container.flex.alignItems(.center).define {
            $0.addItem(collectionView)
        }
    }
    
    private func bind() {
        Task {
            loadedData = try await viewModel.loadList()
            collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}
