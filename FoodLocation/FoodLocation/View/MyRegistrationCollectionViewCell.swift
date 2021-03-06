//
//  MyRegistrationCollectionViewCell.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/08.
//

import UIKit

class MyRegistrationCollectionViewCell: UICollectionViewCell {
    
    let storeImageVIew = UIImageView()
    let storeName = UILabel()
    let foodName = UILabel()
    let foodImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        contentView.addSubview(storeImageVIew)
        storeImageVIew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storeImageVIew.topAnchor.constraint(equalTo: contentView.topAnchor),
            storeImageVIew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storeImageVIew.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storeImageVIew.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
