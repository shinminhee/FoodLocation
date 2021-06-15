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
    let asdlabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()

    }
    
    @objc func registrationButton(_ sender: UIButton) {
        if Auth.auth().currentUser?.uid == nil {
            let VC = LogINViewController()

        } else {
            let logInVC = RegistrationTableViewController()
            logInVC.modalPresentationStyle = .fullScreen
            present(logInVC, animated: true, completion: nil)
        }
    }
}

extension StoreViewController {
    
    func setData() {
        let brownView = NeedLogInView()
        let needLogInLabel = UILabel()
        brownView.backgroundColor = .darkGray
        brownView.alpha = 0.95
        let width: CGFloat = 220
        let height: CGFloat = 100
        brownView.layer.cornerRadius = 15
        brownView.frame = CGRect(x: view.frame.midX - width / 2, y: view.frame.midY - height / 2, width: width, height: height)
        
        needLogInLabel.text = "로그인이 필요한 서비스입니다. \n로그인해주세요."
        needLogInLabel.numberOfLines = 0
        needLogInLabel.alpha = 1
        needLogInLabel.textColor = .yellow
        needLogInLabel.textAlignment = .center
        needLogInLabel.frame = CGRect(x: brownView.frame.minX, y: brownView.frame.minY, width: width, height: height)
        view.addSubview(brownView)
        view.addSubview(needLogInLabel)
        
        NeedLogInView.animate(withDuration: 3) {
                brownView.alpha = 0
                needLogInLabel.alpha = 0
        }
//            completion: { _ in
//            let perVC = PersonalViewController()
//            perVC.modalPresentationStyle = .fullScreen
//            self.present(perVC, animated: true, completion: nil)
//        }


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
        registrationButton.addTarget(self, action: #selector(registrationButton(_:)), for: .touchUpInside)
        registrationButton.layer.shadowColor = UIColor.gray.cgColor // 색깔
        registrationButton.layer.masksToBounds = false
        registrationButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        registrationButton.layer.shadowRadius = 5
        registrationButton.layer.shadowOpacity = 0.3
    
    }
}
