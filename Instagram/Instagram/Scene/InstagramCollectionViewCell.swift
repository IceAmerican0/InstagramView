//
//  InstagramCollectionViewCell.swift
//  Instagram
//
//  Created by 박성준 on 2023/10/16.
//

import UIKit
import FlexLayout
import PinLayout
import Then

struct CellState {
    let imageURL: String
    let title: String
}

final class InstagramCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin.all()
        contentView.flex.layout()
    }
    
    private func buildLayouts() {
        contentView.flex.justifyContent(.center).define {
            $0.addItem(imageView)
        }
    }
    
    func configureCell(_ state: CellState) {
        titleLabel.text = state.title
        
    }
}
