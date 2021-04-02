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
    var locationButton = UIButton()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLocationTextField()
        setStoreTextField()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStoreTextField() {
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
            storeTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setLocationTextField() {
        [locationTextField, locationButton, detailLocationTextField].forEach { (view) in
            self.contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        locationTextField.borderStyle = .roundedRect
        locationTextField.textAlignment = .left
        locationTextField.textColor = UIColor.black
        locationTextField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        locationTextField.placeholder = "위치를 검색해주세요."
        
        locationButton.backgroundColor = .red
        
        detailLocationTextField.borderStyle = .roundedRect
        detailLocationTextField.textAlignment = .left
        detailLocationTextField.textColor = UIColor.black
        detailLocationTextField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        detailLocationTextField.placeholder = "상세 위치 설명을 해주세요."
        
        
        NSLayoutConstraint.activate([
            locationTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            locationTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            locationTextField.heightAnchor.constraint(equalToConstant: 50),
            locationTextField.widthAnchor.constraint(equalToConstant: 200),
            
            locationButton.leadingAnchor.constraint(equalTo: locationTextField.trailingAnchor, constant: 10),
            locationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            locationButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            locationButton.heightAnchor.constraint(equalToConstant: 50),
            
            detailLocationTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            detailLocationTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 10),
            detailLocationTextField.heightAnchor.constraint(equalToConstant: 50),
            detailLocationTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
        
    }
}

