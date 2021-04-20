//
//  CustomCollectionViewCell.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/04.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let storeImageVIew = UIImageView()
    let storeName = UILabel()
    let location = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        contentView.addSubview(storeImageVIew)
        [storeImageVIew, storeName, location].forEach { (view) in
            contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        storeImageVIew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storeImageVIew.topAnchor.constraint(equalTo: contentView.topAnchor),
            storeImageVIew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storeImageVIew.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storeImageVIew.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            storeName.topAnchor.constraint(equalTo: storeImageVIew.topAnchor, constant: 10),
            storeName.leadingAnchor.constraint(equalTo: storeImageVIew.leadingAnchor, constant: 10),
            storeName.heightAnchor.constraint(equalToConstant: 30),
            storeName.widthAnchor.constraint(equalToConstant: 80),
            
            location.topAnchor.constraint(equalTo: storeName.bottomAnchor, constant: 10),
            location.leadingAnchor.constraint(equalTo: storeImageVIew.leadingAnchor, constant: 10),
            location.heightAnchor.constraint(equalToConstant: 30),
            location.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        storeName.font = UIFont.systemFont(ofSize: 10)
        
        location.font = UIFont.systemFont(ofSize: 10)

        
    }
    
}



