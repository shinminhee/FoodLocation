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
    let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingButton(_:)))
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
//        navigationItem.rightBarButtonItem = rightBarButtonItem
        rightBarButtonItem.isEnabled = false
        setUI()
        

    }
    
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
                backgroundView.heightAnchor.constraint(equalToConstant: 260),
                
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
    
    @objc func logIn(_ sender: UIButton) {
        let logInVC = LogINViewController()
        logInVC.modalPresentationStyle = .fullScreen
        present(logInVC, animated: true, completion: nil)
    }
    
    @objc
    func settingButton(_ sender: UIBarButtonItem) {
        let settingVC = SettingViewController()
        settingVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(settingVC, animated: true)
        
    }
 

}
