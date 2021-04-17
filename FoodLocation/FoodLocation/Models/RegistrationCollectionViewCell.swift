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
    let menuText = ["붕어빵", "풀빵", "호두과자", "땅콩빵", "계란빵", "바나나빵", "타코야키", "호떡", "떡볶이", "튀김", "순대", "어묵"]
    let blackMenuText = ["흑붕어빵", "흑풀빵", "흑호두과자", "흑땅콩빵", "흑계란빵", "흑바나나빵", "흑타코야키", "흑호떡", "흑떡볶이", "흑튀김", "흑순대", "흑어묵"]
    
    override var isSelected: Bool {
            didSet{
                if isSelected {
                    menuImage.image = UIImage(named: blackMenuText[Int()])
                }
                else {
                    menuImage.image = UIImage(named: menuText[Int()])
                }
            }
        }
    
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
