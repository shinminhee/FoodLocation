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
    let explanationTextField = UITextView()
    var locationButton = UIButton()
    let okButton = UIButton()
    private var row = 0
    static let identifier = "RegistrationTableViewCell"
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let menuText = ["붕어빵", "풀빵", "호두과자", "땅콩빵", "계란빵", "바나나빵", "타코야키", "호떡", "떡볶이", "튀김", "순대", "어묵"]
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setStoreTextField()
//        setLocationTextField()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       
        
    }
    func configure(row: Int) {
        self.row = row
    }
    @objc
    func setOkButton(_ sender: UIButton) {
        
    }
    @objc
    func setLocationButton(_ sender: UIButton) {
     
        
    }
}

extension RegistrationTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegistrationCollectionViewCell.identifier, for: indexPath) as? RegistrationCollectionViewCell else { fatalError() }
        cell.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        cell.menuImage.image = UIImage(named: menuText[indexPath.item])
        cell.menuLabel.text = menuText[indexPath.row]
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        
        return cell
    }
}
extension RegistrationTableViewCell: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
          if explanationTextField.textColor == UIColor.lightGray {
            explanationTextField.text = nil
            explanationTextField.textColor = UIColor.black
          }
          
      }
    func textViewDidEndEditing(_ textView: UITextView) {
           if explanationTextField.text.isEmpty {
            explanationTextField.text = "추가로 설명하기 \n 추가로 설명하기"
            explanationTextField.textColor = UIColor.lightGray
           }
       }
}

extension RegistrationTableViewCell {
    func setCollectionView() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        collectionView.register(RegistrationCollectionViewCell.self, forCellWithReuseIdentifier: RegistrationCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        
            contentView.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
                collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
                collectionView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 300)
            ])
    }
   
    
    func setStoreTextField() {
        self.contentView.addSubview(storeTextField)
        storeTextField.borderStyle = .roundedRect
        
        storeTextField.textAlignment = .left
        storeTextField.textColor = UIColor.black
        storeTextField.autocapitalizationType = .none
        storeTextField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        storeTextField.placeholder = "가게 이름을 입력해주세요."
        storeTextField.translatesAutoresizingMaskIntoConstraints = false
               
        NSLayoutConstraint.activate([
            storeTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            storeTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            storeTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            storeTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setLocationTextField() {
        [locationTextField, locationButton].forEach { (view) in
            self.contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        locationTextField.borderStyle = .roundedRect
        locationTextField.textAlignment = .left
        locationTextField.textColor = UIColor.black
        locationTextField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        locationTextField.placeholder = "위치를 검색해주세요."
        
        locationButton.backgroundColor = .white
        locationButton.layer.cornerRadius = 10
        locationButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        locationButton.layer.borderWidth = 0.1
        locationButton.layer.borderColor = UIColor.gray.cgColor
        locationButton.layer.shadowColor = UIColor.gray.cgColor // 색깔
        locationButton.layer.masksToBounds = false
        locationButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        locationButton.layer.shadowRadius = 5
        locationButton.layer.shadowOpacity = 0.3
     
        NSLayoutConstraint.activate([
            locationTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            locationTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            locationTextField.heightAnchor.constraint(equalToConstant: 50),
            locationTextField.widthAnchor.constraint(equalToConstant: 290),
            
            locationButton.leadingAnchor.constraint(equalTo: locationTextField.trailingAnchor, constant: 10),
            locationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            locationButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            locationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setDetailLocationTextField() {
        self.contentView.addSubview(detailLocationTextField)
        detailLocationTextField.borderStyle = .roundedRect
        detailLocationTextField.textAlignment = .left
        detailLocationTextField.textColor = UIColor.black
        detailLocationTextField.autocapitalizationType = .none
        detailLocationTextField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        detailLocationTextField.placeholder = "상세 위치 설명을 해주세요."
        detailLocationTextField.translatesAutoresizingMaskIntoConstraints = false
               
        NSLayoutConstraint.activate([
            detailLocationTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            detailLocationTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            detailLocationTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            detailLocationTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    func setExplanationTextField() {
        self.contentView.addSubview(explanationTextField)
        explanationTextField.delegate = self
        explanationTextField.text = "\n추가로 설명하기 \n추가로 설명하기"
        explanationTextField.textColor = UIColor.lightGray
        explanationTextField.textAlignment = .left
        explanationTextField.textColor = UIColor.lightGray
        explanationTextField.autocapitalizationType = .none
        explanationTextField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        explanationTextField.layer.borderWidth = 0.1
        explanationTextField.layer.borderColor = UIColor.gray.cgColor
        explanationTextField.layer.cornerRadius = 10
        explanationTextField.translatesAutoresizingMaskIntoConstraints = false
               
        NSLayoutConstraint.activate([
            explanationTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            explanationTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            explanationTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            explanationTextField.heightAnchor.constraint(equalToConstant: 100),
        ])
        
    }
    func setOkButton() {
        self.contentView.addSubview(okButton)
        okButton.setTitle("등록하기", for: .normal)
        okButton.setTitleColor(.black, for: .normal)
        okButton.layer.cornerRadius = 10
        okButton.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        okButton.layer.borderColor = UIColor.lightGray.cgColor
        okButton.layer.borderWidth = 0.3
        okButton.addTarget(self, action: #selector(setOkButton(_:)), for: .touchUpInside)
        okButton.layer.shadowColor = UIColor.gray.cgColor // 색깔
        okButton.layer.masksToBounds = false
        okButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        okButton.layer.shadowRadius = 5
        okButton.layer.shadowOpacity = 0.3
        okButton.translatesAutoresizingMaskIntoConstraints = false
               
        NSLayoutConstraint.activate([
            okButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            okButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            okButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
   
}


