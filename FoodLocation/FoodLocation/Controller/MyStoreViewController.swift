//
//  MyStoreViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/04.
//

import UIKit

class MyStoreViewController: UIViewController {
    
    let backgroundView = UIView()
    let logInLabel = UILabel()
    let myStore = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        setUI()
        setButton()
    }
    @objc
    func myStore(_ sender: UIButton) {
        let mapAndStoreVC = MapAndStoreViewController()
        self.navigationController?.pushViewController(mapAndStoreVC, animated: true)
    }
    
}


extension MyStoreViewController {
    
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
            logInLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.shadowColor = UIColor.gray.cgColor // 색깔
        backgroundView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        backgroundView.layer.shadowRadius = 5 // 반경
        backgroundView.layer.shadowOpacity = 0.3 // alpha값
        
        
        logInLabel.text = "내가 등록한 가게"
        logInLabel.textAlignment = .center
        logInLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
    }
    
    func setButton() {
        view.addSubview(myStore)
        myStore.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        myStore.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStore.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myStore.widthAnchor.constraint(equalToConstant: 300),
            myStore.heightAnchor.constraint(equalToConstant: 100)
        ])
        myStore.setTitle("등록한 가게 보러가기", for: .normal)
        myStore.backgroundColor = .red
        myStore.addTarget(self, action: #selector(myStore(_:)), for: .touchUpInside)
    }
}

