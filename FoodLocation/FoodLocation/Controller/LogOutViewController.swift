//
//  LogOutViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/22.
//

import UIKit
import Firebase

class LogOutViewController: UIViewController {
    
    let logOutButton = UIButton()
    weak var delegate: LogOutViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        
        
    }
    
    @objc
    func button(_ sender: UIButton) {
        print(#function)
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        let personalVC = PersonalViewController()
        let text = personalVC.logInLabel.text
        self.delegate?.logOutButtonPressed(text: text ?? "")
        dismiss(animated: true, completion: nil)
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
    }
    
}
protocol LogOutViewControllerDelegate: class {
    func logOutButtonPressed(text: String)
}

extension LogOutViewController{
    
    func setUI() {
        view.addSubview(logOutButton)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logOutButton.widthAnchor.constraint(equalToConstant: 50),
            logOutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        logOutButton.backgroundColor = .red
        logOutButton.addTarget(self, action: #selector(button(_:)), for: .touchUpInside)
    }
    
}

