//
//  LogINViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit

class PersonalViewController: UIViewController {
    
    let backgroundView = UIView()
    let logInLabel = UILabel()
    
    let likeStoreLabel = UILabel()
    let regiStoreLabel = UILabel()
    let commentLabel = UILabel()
    
    let likeStoreViewLabel = UILabel()
    let regiStoreViewLabel = UILabel()
    let commentViewLabel = UILabel()
    
    let likeStoreView = UIView()
    let regiStoreView = UIView()
    let commentView = UIView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        let rightBarButtonItem = UIBarButtonItem(image: (UIImage(systemName: "gearshape")), style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingButton(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        setUI()
        setLike()
        setRegistration()
        setComment()
        
        
    }
    
    @objc func logIn(_ sender: UIButton) {
        let logInVC = LogINViewController()
        logInVC.modalPresentationStyle = .fullScreen
        present(logInVC, animated: true, completion: nil)
    }
    
    @objc
    func settingButton(_ sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
        
    }
    
    
}

extension PersonalViewController {
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
            backgroundView.heightAnchor.constraint(equalToConstant: 200),
            
            logInLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            logInLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
            logInLabel.widthAnchor.constraint(equalToConstant: 120),
            logInLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        backgroundView.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.shadowColor = UIColor.gray.cgColor // 색깔
        backgroundView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        backgroundView.layer.shadowRadius = 5 // 반경
        backgroundView.layer.shadowOpacity = 0.3 // alpha값
        
        logInLabel.text = "로그인이 \n필요해요. >"
        logInLabel.textAlignment = .left
        logInLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        logInLabel.numberOfLines = 0
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(logIn(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        logInLabel.addGestureRecognizer(searchBarTaped)
        logInLabel.isUserInteractionEnabled = true
    }
    
    func setLike() {
        [likeStoreLabel, likeStoreView, likeStoreViewLabel].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            likeStoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            likeStoreLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 20),
            likeStoreLabel.widthAnchor.constraint(equalToConstant: 200),
            
            likeStoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            likeStoreView.topAnchor.constraint(equalTo:likeStoreLabel.bottomAnchor, constant: 20),
            likeStoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            likeStoreView.heightAnchor.constraint(equalToConstant: 80),
            
            likeStoreViewLabel.centerYAnchor.constraint(equalTo: likeStoreView.centerYAnchor),
            likeStoreViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        likeStoreLabel.text = "내가 찜한 가게"
        likeStoreLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        likeStoreView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        
        likeStoreViewLabel.text = "내가 찜한 가게가 없어요."
        likeStoreViewLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        likeStoreViewLabel.textColor = .lightGray

        
    }
    func setRegistration() {
        
        [regiStoreView, regiStoreLabel, regiStoreViewLabel].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            regiStoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regiStoreLabel.topAnchor.constraint(equalTo: likeStoreView.bottomAnchor, constant: 20),
            regiStoreLabel.widthAnchor.constraint(equalToConstant: 200),
            
            regiStoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regiStoreView.topAnchor.constraint(equalTo:regiStoreLabel.bottomAnchor, constant: 20),
            regiStoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            regiStoreView.heightAnchor.constraint(equalToConstant: 80),
            
            regiStoreViewLabel.centerYAnchor.constraint(equalTo: regiStoreView.centerYAnchor),
            regiStoreViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        regiStoreLabel.text = "내가 등록한 가게"
        regiStoreLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        regiStoreView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        
        regiStoreViewLabel.text = "내가 등록한 가게가 없어요."
        regiStoreViewLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        regiStoreViewLabel.textColor = .lightGray
    }
    
    func setComment() {
        
        [commentLabel, commentView, commentViewLabel].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            commentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentLabel.topAnchor.constraint(equalTo: regiStoreView.bottomAnchor, constant: 20),
            commentLabel.widthAnchor.constraint(equalToConstant: 200),
            
            commentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentView.topAnchor.constraint(equalTo:commentLabel.bottomAnchor, constant: 20),
            commentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentView.heightAnchor.constraint(equalToConstant: 80),
            
            commentViewLabel.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            commentViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        commentLabel.text = "내가 쓴 댓글"
        commentLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        commentView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        
        commentViewLabel.text = "내가 쓴 댓글이 없어요."
        commentViewLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        commentViewLabel.textColor = .lightGray
        
    }
    
}
