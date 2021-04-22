//
//  StoreViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit
import Firebase

class StoreViewController: UIViewController {
    
    let storeImage = UIImageView()
    let registrationLabel = UILabel()
    let smallLabel = UILabel()
    let registrationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()

    }
    
    @objc func logIn(_ sender: UIButton) {
        if Auth.auth().currentUser?.uid == nil {
            setData()
            
        } else {
            let logInVC = RegistrationTableViewController()
            logInVC.modalPresentationStyle = .fullScreen
            present(logInVC, animated: true, completion: nil)
        }
    }
}

extension StoreViewController {
    
    func setData() {
        view.addSubview(NeedLogInView(view: view))
        NeedLogInView.animate(withDuration: 1) {
            self.view.alpha = 0.9
        } completion: { _ in
            self.view.alpha = 0
        }
    }
    
    func setUI() {
        [storeImage, registrationLabel, smallLabel, registrationButton].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        NSLayoutConstraint.activate([
            storeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            storeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            storeImage.widthAnchor.constraint(equalToConstant: 150),
            storeImage.heightAnchor.constraint(equalToConstant: 150),
            
            registrationLabel.topAnchor.constraint(equalTo: storeImage.bottomAnchor, constant: 40),
            registrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationLabel.widthAnchor.constraint(equalToConstant: 200),
            registrationLabel.heightAnchor.constraint(equalToConstant: 60),
            
            smallLabel.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 10),
            smallLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smallLabel.widthAnchor.constraint(equalToConstant: 200),
            smallLabel.heightAnchor.constraint(equalToConstant: 100),
            
            registrationButton.topAnchor.constraint(equalTo: smallLabel.bottomAnchor, constant: 100),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registrationButton.heightAnchor.constraint(equalToConstant: 50)
          
        ])
        
        storeImage.image = UIImage(named: "store")
        
        registrationLabel.text = "등록해주세요."
        registrationLabel.textAlignment = .center
        registrationLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        smallLabel.text = "주변에 아는 가게가 있다면 \n사람들에게 알려주세요."
        smallLabel.textAlignment = .center
        smallLabel.numberOfLines = 0
        smallLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        registrationButton.setTitle("등록 하러 가기", for: .normal)
        registrationButton.setTitleColor(.black, for: .normal)
        registrationButton.layer.cornerRadius = 10
        registrationButton.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        registrationButton.layer.borderColor = UIColor.lightGray.cgColor
        registrationButton.layer.borderWidth = 0.3
        registrationButton.addTarget(self, action: #selector(logIn(_:)), for: .touchUpInside)
        registrationButton.layer.shadowColor = UIColor.gray.cgColor // 색깔
        registrationButton.layer.masksToBounds = false
        registrationButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        registrationButton.layer.shadowRadius = 5
        registrationButton.layer.shadowOpacity = 0.3
    
    }
}
