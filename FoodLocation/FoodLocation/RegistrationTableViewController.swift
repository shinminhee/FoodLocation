//
//  RegistrationTableViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/27.
//

import UIKit

class Store {
    var storeName: String?
    var detailName: [String]?
    
    init(storeName: String, detailName: [String]) {
        self.storeName = storeName
        self.detailName = detailName
    }
}

class RegistrationTableViewController: UIViewController {
    
    let backgroundView = UIView()
    let logInLabel = UILabel()
    let closeButton = UIImageView()
    let menuTableView = UITableView()
//    let data = ["가게 이름", "위치", "메뉴", "맛/수량/가격 \n상세설명"]
    let textField = UITextField()
    let Button = UIButton()
    var store = [Store]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        menuTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setUI()
        setTableView()
        
        store.append(Store.init(storeName: "가게 이름", detailName: ["1"]))
        store.append(Store.init(storeName: "위치", detailName: ["1", "2"]))
        store.append(Store.init(storeName: "메뉴", detailName: ["1", "2", "3"]))
        store.append(Store.init(storeName: "맛/수량/가격 \n상세설명", detailName: ["1", "2"]))
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return store.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store[section].detailName?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationTableViewCell", for: indexPath) as? RegistrationTableViewCell else { fatalError() }
        cell.backgroundColor = view.backgroundColor
        cell.storeTextField.text = textField.text

//        switch Store.{
//        case ["가게 이름"]:
//            cell.storeTextField.text = textField.text
//        case ["위치"]:
//            cell.locationTextField.text = textField.text
//        case ["메뉴"]:
//            cell.storeTextField.text = textField.text
//        case ["맛/수량/가격 \n상세설명"]:
//            cell.locationTextField.text = textField.text
//        default:
//            break
          return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return store[section].storeName
//        let myLabel = UILabel()
//        myLabel.font = UIFont.boldSystemFont(ofSize: 30)
//        myLabel.text = self.data[section]
//
//        return "\(data[section])"
        
    }
    func tableView(_ tableView: UITableView, viewForHeaterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height:40))
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.text = store[section].storeName
        lbl.numberOfLines = 0
        view.addSubview(lbl)
        return view
    }
    
    
    
}

