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
    var emptyNickName: String? = ""
    var nickVC: NickNameViewController?
    let brownView = NeedLogInView()
    let needLogInLabel = UILabel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(nickVC: NickNameViewController) {
        self.nickVC = nickVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn() // 자동로그인
//        GIDSignIn.sharedInstance()?.signIn() // 로그인
//        GIDSignIn.sharedInstance()?.signOut() // 로그아웃
//        GIDSignIn.sharedInstance()?.disconnect() // 연동해제
        setUI()
        configureUI()
        setData()
        setGoogleSignInButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.brownView.alpha = 0
            self.needLogInLabel.alpha = 0
        }
    }
    
    func setUserStatus() {
        if Auth.auth().currentUser?.uid == nil {
            
        } else {
            configureUI()
        }
    }
    
    @objc
    func closeTaped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}

extension LogINViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { [self] (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Login Successful")
                    if let userId = user.userID,
                               let idToken = user.authentication.idToken,
                               let fullName = user.profile.name,
                               let givenName = user.profile.givenName,
                               let familyName = user.profile.familyName,
                               let email = user.profile.email {
                   
                               print("Token : \(idToken)")
                               print("User ID : \(userId)")
                               print("User Email : \(email)")
                               print("User Name : \((fullName))")
                   
                        self.nickVC?.modalPresentationStyle = .fullScreen
                               present(nickVC!,animated: true, completion: nil)
                           } else {
                               print("Error : User Data Not Found")
                           }
                }
            }
    }
        
    // 구글 로그인 연동 해제했을때 불러오는 메소드
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Disconnect")
    }
}

extension LogINViewController {
    func setData() {
        
        brownView.backgroundColor = .darkGray
        brownView.alpha = 0.95
        let width: CGFloat = 220
        let height: CGFloat = 100
        brownView.layer.cornerRadius = 15
        brownView.frame = CGRect(x: view.frame.midX - width / 2, y: view.frame.midY - 200, width: width, height: height)
        
        needLogInLabel.text = "로그인이 필요한 서비스입니다. \n로그인해주세요."
        needLogInLabel.numberOfLines = 0
        needLogInLabel.textColor = .yellow
        needLogInLabel.textAlignment = .center
        needLogInLabel.frame = CGRect(x: brownView.frame.minX, y: brownView.frame.minY, width: width, height: height)
        view.addSubview(brownView)
        view.addSubview(needLogInLabel)

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
    
    func setGoogleSignInButton() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
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
}

