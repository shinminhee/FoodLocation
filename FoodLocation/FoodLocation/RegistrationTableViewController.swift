//
//  RegistrationTableViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/27.
//

import UIKit

class RegistrationTableViewController: UIViewController {
    
    let backgroundView = UIView()
    let logInLabel = UILabel()
    let closeButton = UIImageView()
    let menuTableView = UITableView(frame: .zero, style: .grouped)
    let data = ["가게 이름", "위치", "메뉴", "맛/수량/가격 \n상세설명"]
    let textField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        menuTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setUI()
        setTableView()
        
        
    }

    
    func setUI() {
        view.addSubview(backgroundView)
        [backgroundView, logInLabel, closeButton, menuTableView].forEach { (view) in
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
        
        
        logInLabel.text = "등록하기"
        logInLabel.textAlignment = .center
        logInLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        closeButton.image = UIImage(systemName: "xmark")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(closeTaped(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        closeButton.addGestureRecognizer(searchBarTaped)
        closeButton.isUserInteractionEnabled = true
        
    }
    
    func setTableView() {
        view.addSubview(menuTableView)
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
    
        menuTableView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        menuTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
//        menuTableView.backgroundColor = .red
        menuTableView.dataSource = self
        menuTableView.register(RegistrationTableViewCell.self, forCellReuseIdentifier: "RegistrationTableViewCell")
        menuTableView.rowHeight = 50
//        menuTableView.separatorInset.right = 20 // 셀 나눠주는 선 끝부분 공백
        
        
    }
    
    @objc
    func closeTaped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension RegistrationTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let myLabel = UILabel()
        myLabel.font = UIFont.boldSystemFont(ofSize: 30)
        myLabel.text = self.data[section]
        
        return "\(data[section])"
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationTableViewCell", for: indexPath) as? RegistrationTableViewCell else { fatalError() }
        cell.backgroundColor = view.backgroundColor
        cell.storeTextField.text = textField.text
        
        return cell
    }
    
}

