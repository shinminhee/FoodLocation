//
//  NickNameViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/07.
//

import UIKit

class NickNameViewController: UIViewController {
    
    
    let nickNameTextField = UITextField()
    let nickNameLabel = UILabel()
    let startButton = UIButton()
    weak var delegate: NickNameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    @objc
    func startButton(_ sender: UIButton) {
        guard let text = nickNameTextField.text else {return}
        self.delegate?.startButtonPressed(text: text)
        print(text)
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
//        guard let nickName = nickNameTextField.text else { return }
//        var userList: [[String: String]]
//        if let tempList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
//            userList = tempList
//        } else {
//            userList = []
//        }
//        let nickNameData: [String:String] = ["여기 닉네임을 입력해주세요.": nickName]
//        userList.append(nickNameData)
//        UserDefaults.standard.set(userList, forKey: "UserList")
        }
    }

protocol NickNameViewControllerDelegate: class {
    func startButtonPressed(text: String)
}

extension NickNameViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        let limitLength = 10
        return newLength <= limitLength
    }
}

extension NickNameViewController {
    func setUI() {
        [nickNameLabel, nickNameTextField, startButton].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            nickNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nickNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            nickNameLabel.widthAnchor.constraint(equalToConstant: 250),
            nickNameLabel.heightAnchor.constraint(equalToConstant: 100),
            
            nickNameTextField.centerXAnchor.constraint(equalTo: nickNameLabel.centerXAnchor),
            nickNameTextField.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 60),
            nickNameTextField.heightAnchor.constraint(equalToConstant: 50),
            nickNameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            startButton.centerXAnchor.constraint(equalTo: nickNameTextField.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 20),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        startButton.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.layer.cornerRadius = 10
        startButton.layer.borderColor = UIColor.lightGray.cgColor
        startButton.layer.borderWidth = 0.3
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        startButton.layer.shadowColor = UIColor.gray.cgColor
        startButton.layer.masksToBounds = false
        startButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        startButton.layer.shadowRadius = 5
        startButton.layer.shadowOpacity = 0.3
        
        nickNameLabel.text = "닉네임을 설정해주세요."
        nickNameLabel.textAlignment = .center
        nickNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        
        nickNameTextField.placeholder = "여기 닉네임을 입력해주세요."
        nickNameTextField.borderStyle = .roundedRect
        nickNameTextField.delegate = self
    }
}


