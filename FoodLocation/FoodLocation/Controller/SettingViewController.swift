//
//  SettingViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit

class SettingViewController: UIViewController {
    
    let backgroundView = UIView()
    let logInLabel = UILabel()
    
    let impormationView = UIView()
    let emailView = UIView()
    let licensesView = UIView()
    let versionView = UIView()
    
    let impormationLabel = UILabel()
    let emailLabel = UILabel()
    let licensesLabel = UILabel()
    let versionLabel = UILabel()
    
    let impormationButton = UIButton()
    let emailButton = UIButton()
    let licensesButton = UIButton()
    let versionButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        setUI()
        setImpormation()
        setEmail()
        setLicenses()
        setVersion()
        
    }

}

extension SettingViewController {
    func setUI() {
        view.addSubview(backgroundView)
        [backgroundView, logInLabel].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
            
            NSLayoutConstraint.activate([
                backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundView.heightAnchor.constraint(equalToConstant: 100),
                
                logInLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                logInLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
                logInLabel.heightAnchor.constraint(equalToConstant: 30),
                logInLabel.widthAnchor.constraint(equalToConstant: 100)
                
            ])
            
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.shadowColor = UIColor.gray.cgColor // 색깔
        backgroundView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        backgroundView.layer.shadowRadius = 5 // 반경
        backgroundView.layer.shadowOpacity = 0.3 // alpha값
        
        logInLabel.text = "로그인"
        logInLabel.textAlignment = .center
        logInLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)

    }
    func setImpormation() {
        [impormationView, impormationLabel, impormationButton].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
            
            NSLayoutConstraint.activate([
                impormationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                impormationView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 5),
                impormationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                impormationView.heightAnchor.constraint(equalToConstant: 80),
                
                impormationLabel.leadingAnchor.constraint(equalTo: impormationView.leadingAnchor, constant: 20),
                impormationLabel.centerYAnchor.constraint(equalTo: impormationView.centerYAnchor),
                impormationLabel.widthAnchor.constraint(equalToConstant: 200),
                impormationLabel.heightAnchor.constraint(equalToConstant: 60),
                
                impormationButton.trailingAnchor.constraint(equalTo: impormationView.trailingAnchor),
                impormationButton.centerYAnchor.constraint(equalTo: impormationView.centerYAnchor),
                impormationButton.heightAnchor.constraint(equalToConstant: 80),
                impormationButton.widthAnchor.constraint(equalToConstant: 50)
            
            ])
        
        impormationView.backgroundColor = .white
        
        impormationLabel.text = "개인정보처리방침"
        
        impormationButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        
    }
    func setEmail() {
        
        [emailView, emailLabel, emailButton].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
            
            NSLayoutConstraint.activate([
                emailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                emailView.topAnchor.constraint(equalTo: impormationView.bottomAnchor, constant: 3),
                emailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                emailView.heightAnchor.constraint(equalToConstant: 80),
                
                emailLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 20),
                emailLabel.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
                emailLabel.widthAnchor.constraint(equalToConstant: 200),
                emailLabel.heightAnchor.constraint(equalToConstant: 60),
                
                emailButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
                emailButton.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
                emailButton.heightAnchor.constraint(equalToConstant: 80),
                emailButton.widthAnchor.constraint(equalToConstant: 50)
            
            ])
        
        emailView.backgroundColor = .white
        
        emailLabel.text = "이메일 문의하기"
        
        emailButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    }
    
    func setLicenses() {
        [licensesView, licensesLabel, licensesButton].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
            
            NSLayoutConstraint.activate([
                licensesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                licensesView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 10),
                licensesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                licensesView.heightAnchor.constraint(equalToConstant: 80),
                
                licensesLabel.leadingAnchor.constraint(equalTo: licensesView.leadingAnchor, constant: 20),
                licensesLabel.centerYAnchor.constraint(equalTo: licensesView.centerYAnchor),
                licensesLabel.widthAnchor.constraint(equalToConstant: 200),
                licensesLabel.heightAnchor.constraint(equalToConstant: 60),
                
                licensesButton.trailingAnchor.constraint(equalTo: licensesView.trailingAnchor),
                licensesButton.centerYAnchor.constraint(equalTo: licensesView.centerYAnchor),
                licensesButton.heightAnchor.constraint(equalToConstant: 80),
                licensesButton.widthAnchor.constraint(equalToConstant: 50)
            
            ])
        
        licensesView.backgroundColor = .white
        
        licensesLabel.text = "Open Source Licenses"
        
        licensesButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
    }
    func setVersion() {
        
        [versionView, versionLabel, versionButton].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
            
            NSLayoutConstraint.activate([
                versionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                versionView.topAnchor.constraint(equalTo: licensesView.bottomAnchor, constant: 10),
                versionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                versionView.heightAnchor.constraint(equalToConstant: 80),
                
                versionLabel.leadingAnchor.constraint(equalTo: versionView.leadingAnchor, constant: 20),
                versionLabel.centerYAnchor.constraint(equalTo: versionView.centerYAnchor),
                versionLabel.widthAnchor.constraint(equalToConstant: 200),
                versionLabel.heightAnchor.constraint(equalToConstant: 60),
                
                versionButton.trailingAnchor.constraint(equalTo: versionView.trailingAnchor),
                versionButton.centerYAnchor.constraint(equalTo: versionView.centerYAnchor),
                versionButton.heightAnchor.constraint(equalToConstant: 80),
                versionButton.widthAnchor.constraint(equalToConstant: 50)
            
            ])
        
        versionView.backgroundColor = .white
        
        versionLabel.text = "현재 버전"
        
        versionButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    }

}



