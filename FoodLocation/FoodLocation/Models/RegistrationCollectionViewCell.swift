//
//  RegistrationCollectionViewCell.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/06.
//

import UIKit

class RegistrationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    let menuImage = UIImageView()
    let menuLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RegistrationCollectionViewCell {
    final private func setUI() {
        setBasic()
        setLayouts()
        [menuImage, menuLabel].forEach { (view) in
            contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            menuImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            menuImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuImage.heightAnchor.constraint(equalToConstant: 65),
            
            menuLabel.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 3),
            menuLabel.centerXAnchor.constraint(equalTo: menuImage.centerXAnchor),
            menuLabel.heightAnchor.constraint(equalToConstant: 13)
        ])
        
        menuImage.clipsToBounds = true
        menuImage.layer.cornerRadius = 10
        menuLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
    }
    final private func setBasic() {
        
    }
    final private func setLayouts() {
        
    }
    
}
