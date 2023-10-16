//
//  HomeViewController.swift
//  Instagram
//
//  Created by 박성준 on 2023/10/16.
//

import UIKit
import FlexLayout
import PinLayout
import Then
import RxSwift

class HomeViewController: UIViewController {
    
    let container = UIView()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.delegate = self
        $0.register(InstagramCollectionViewCell.self, forCellWithReuseIdentifier: "InstagramCollectionViewCell")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(container)
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

}

extension HomeViewController: UICollectionViewDelegate {
    
}
