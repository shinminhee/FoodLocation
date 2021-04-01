//
//  LogINViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit
import Firebase
import GoogleSignIn

class LogINViewController: UIViewController {

    let backgroundView = UIView()
    let logInLabel = UILabel()
    let closeButton = UIImageView()
    let googleLoginButton = GIDSignInButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        setUI()
        configureUI()
        
        
    }
    
    private func configureUI() {
          view.addSubview(googleLoginButton)
          googleLoginButton.translatesAutoresizingMaskIntoConstraints = false

          NSLayoutConstraint.activate([
              googleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              googleLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            googleLoginButton.widthAnchor.constraint(equalToConstant: 300)
          ])
      }
  
    
    func setUI() {
        view.addSubview(backgroundView)
        [backgroundView, logInLabel, closeButton].forEach { (view) in
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
                logInLabel.widthAnchor.constraint(equalToConstant: 100),
                
                closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                closeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
                closeButton.heightAnchor.constraint(equalToConstant: 30),
                closeButton.widthAnchor.constraint(equalToConstant: 30)
                
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
        
        closeButton.image = UIImage(systemName: "xmark")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(closeTaped(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        closeButton.addGestureRecognizer(searchBarTaped)
        closeButton.isUserInteractionEnabled = true

    }
    
    @objc
    func closeTaped(_ sender: UITapGestureRecognizer) {
       dismiss(animated: true, completion: nil)
    }
 

}

