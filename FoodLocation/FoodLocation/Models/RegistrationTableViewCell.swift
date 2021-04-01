//
//  RegistrationTableViewCell.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/27.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell {
    
    let storeTextField = UITextField()
    let locationTextField = UITextField()
    let detailLocationTextField = UITextField()
    let explanationTextField = UITextField()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setPart()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPart() {
        self.contentView.addSubview(storeTextField)
        storeTextField.borderStyle = .roundedRect
     
        storeTextField.textAlignment = .left
        storeTextField.textColor = UIColor.black
//        storeTextField.autocapitalizationType = .none
        storeTextField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        storeTextField.placeholder = "가게 이름을 입력해주세요."
        storeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        

        
        NSLayoutConstraint.activate([
            storeTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            storeTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            storeTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
    }
}

