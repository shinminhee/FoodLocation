//
//  LogINViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit
import Firebase
import GoogleSignIn


class PersonalViewController: UIViewController {
    
    let backgroundView = UIView()
    var logInLabel = UILabel()
    
    let likeStoreLabel = UILabel()
    let regiStoreLabel = UILabel()
    let commentLabel = UILabel()
    
    let likeStoreViewLabel = UILabel()
    let regiStoreViewLabel = UILabel()
    let commentViewLabel = UILabel()
    
    let likeStoreView = UIView()
    let regiStoreView = UIView()
    let commentView = UIView()
    
    let plusStore = UILabel()
    let plusComment = UILabel()
    let plusFavorite = UILabel()
    var numberObCell: Int = 1
    
    let storeImageText = ["store1", "store2", "store3", "store4", "store5", "store6", "store7", "store8", "store9", "store10", "store11", "store12"]
    let colors: [UIColor] = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemPink, UIColor.systemYellow, UIColor.systemIndigo, UIColor.systemRed, UIColor.systemBlue, UIColor.systemPink, UIColor.systemYellow, UIColor.systemIndigo]
    let collectionLayout = UICollectionViewFlowLayout() //collectionviewlayout 잡기위함
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    
    let regiCollectionLayout = UICollectionViewFlowLayout()
    lazy var regiCollectionView = UICollectionView(frame: .zero, collectionViewLayout: regiCollectionLayout)
    
    var emptyNickName: String? = ""
    let nickVC = NickNameViewController()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        let rightBarButtonItem = UIBarButtonItem(image: (UIImage(systemName: "gearshape")), style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingButton(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        setUI()
        setLike()
        setRegistration()
        setComment()
        setCollection()
        setLayout()

    }
    
    @objc func logIn(_ sender: UIButton) {
        if Auth.auth().currentUser?.uid == nil {
            let logInVC = LogINViewController(nickVC: nickVC)
            nickVC.delegate = self
            logInVC.modalPresentationStyle = .fullScreen
            present(logInVC, animated: true, completion: nil)
        } else {
            let logOutVC = LogOutViewController()
            logOutVC.delegate = self
            logOutVC.modalPresentationStyle = .fullScreen
            present(logOutVC, animated: true, completion: nil)
        }
    }
    
    @objc func plusStore(_ sender: UITapGestureRecognizer) {
        let logInVC = MyStoreViewController()
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    @objc func plusComment(_ sender: UITapGestureRecognizer) {
        let logInVC = MyCommentViewController()
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    @objc func plusFavorite(_ sender: UITapGestureRecognizer) {
        let logInVC = MyFavoriteViewController()
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    @objc
    func settingButton(_ sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
    }
}
extension PersonalViewController: LogOutViewControllerDelegate {
    func logOutButtonPressed(text: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "chevron.right")
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        //이미지 추가 같은 타입으로 설정
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        //글자 만들기
        let completeText = NSMutableAttributedString(string: "로그인이 \n필요해요  ", attributes: font)
        //글자에 이미지 추가
        completeText.append(attachmentString)
        logInLabel.attributedText = completeText
        logInLabel.textAlignment = .left
        logInLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        logInLabel.numberOfLines = 0
    }
  
}

  
extension PersonalViewController: NickNameViewControllerDelegate {
    func startButtonPressed(text: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "chevron.right")
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        //이미지 추가 같은 타입으로 설정
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        //글자 만들기
        let completeText = NSMutableAttributedString(string: "안녕하세요 \n\(text)님  ", attributes: font)
        //글자에 이미지 추가
        completeText.append(attachmentString)
        logInLabel.attributedText = completeText
        logInLabel.textAlignment = .left
        logInLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        logInLabel.numberOfLines = 0
        
    }
}

extension PersonalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberObCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        collectionCell.storeImageVIew.image = UIImage(named: storeImageText[indexPath.item])
        collectionCell.clipsToBounds = true
        collectionCell.layer.cornerRadius = 15
        
        return collectionCell
    }
}
    
extension PersonalViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        self.numberObCell += 1
        collectionView.reloadData()
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

        if Auth.auth().currentUser?.uid == nil {
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "chevron.right")
            let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
            //이미지 추가 같은 타입으로 설정
            let attachmentString = NSAttributedString(attachment: imageAttachment)
            //글자 만들기
            let completeText = NSMutableAttributedString(string: "로그인이 \n필요해요  ", attributes: font)
            //글자에 이미지 추가
            completeText.append(attachmentString)
            logInLabel.attributedText = completeText
            logInLabel.textAlignment = .left
            logInLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            logInLabel.numberOfLines = 0
        } else {
            logInLabel.text = "ggggggg"
            // 델리게이션 함수 쓸수 있는지 ,,
        }
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(logIn(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        logInLabel.addGestureRecognizer(searchBarTaped)
        logInLabel.isUserInteractionEnabled = true
//        logInLabel.text = "안녕하세요"
        
    }
    
    func setLike() {
        [likeStoreLabel, likeStoreView, likeStoreViewLabel, plusFavorite].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            likeStoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            likeStoreLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 20),
            likeStoreLabel.widthAnchor.constraint(equalToConstant: 200),
            
            plusFavorite.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plusFavorite.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 20),
            plusFavorite.widthAnchor.constraint(equalToConstant: 60),
            
            
            likeStoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            likeStoreView.topAnchor.constraint(equalTo:likeStoreLabel.bottomAnchor, constant: 20),
            likeStoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            likeStoreView.heightAnchor.constraint(equalToConstant: 80),
            
            likeStoreViewLabel.centerYAnchor.constraint(equalTo: likeStoreView.centerYAnchor),
            likeStoreViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        likeStoreLabel.text = "내가 찜한 가게"
        likeStoreLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(plusFavorite(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        plusFavorite.addGestureRecognizer(searchBarTaped)
        plusFavorite.isUserInteractionEnabled = true
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "chevron.right")
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "더보기 ", attributes: font)
        completeText.append(attachmentString)
        plusFavorite.attributedText = completeText
        plusFavorite.font = UIFont.systemFont(ofSize: 15, weight: .light)
        plusFavorite.textColor = .lightGray
        plusFavorite.textAlignment = .left
        
        likeStoreView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        
        likeStoreViewLabel.text = "내가 찜한 가게가 없어요."
        likeStoreViewLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        likeStoreViewLabel.textColor = .lightGray
    }
    
    func setRegistration() {
        
        [regiStoreView, regiStoreLabel, regiStoreViewLabel, plusStore].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            regiStoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regiStoreLabel.topAnchor.constraint(equalTo: likeStoreView.bottomAnchor, constant: 20),
            regiStoreLabel.widthAnchor.constraint(equalToConstant: 200),
            
            plusStore.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plusStore.topAnchor.constraint(equalTo: likeStoreView.bottomAnchor, constant: 20),
            plusStore.widthAnchor.constraint(equalToConstant: 60),
            
            regiStoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regiStoreView.topAnchor.constraint(equalTo:regiStoreLabel.bottomAnchor, constant: 20),
            regiStoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            regiStoreView.heightAnchor.constraint(equalToConstant: 80),
            
            regiStoreViewLabel.centerYAnchor.constraint(equalTo: regiStoreView.centerYAnchor),
            regiStoreViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        regiStoreLabel.text = "내가 등록한 가게"
        regiStoreLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(plusStore(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        plusStore.addGestureRecognizer(searchBarTaped)
        plusStore.isUserInteractionEnabled = true
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "chevron.right")
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "더보기 ", attributes: font)
        completeText.append(attachmentString)
        plusStore.attributedText = completeText
        plusStore.font = UIFont.systemFont(ofSize: 15, weight: .light)
        plusStore.textColor = .lightGray
        plusStore.textAlignment = .left
        
        regiStoreView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        
        regiStoreViewLabel.text = "내가 등록한 가게가 없어요."
        regiStoreViewLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        regiStoreViewLabel.textColor = .lightGray
    }
    
    func setComment() {
        
        [commentLabel, commentView, commentViewLabel, plusComment].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            commentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentLabel.topAnchor.constraint(equalTo: regiStoreView.bottomAnchor, constant: 20),
            commentLabel.widthAnchor.constraint(equalToConstant: 200),
            
            plusComment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plusComment.topAnchor.constraint(equalTo: regiStoreView.bottomAnchor, constant: 20),
            plusComment.widthAnchor.constraint(equalToConstant: 60),
        
            commentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentView.topAnchor.constraint(equalTo:commentLabel.bottomAnchor, constant: 20),
            commentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentView.heightAnchor.constraint(equalToConstant: 80),
            
            commentViewLabel.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            commentViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        commentLabel.text = "내가 쓴 댓글"
        commentLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(plusComment(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        plusComment.addGestureRecognizer(searchBarTaped)
        plusComment.isUserInteractionEnabled = true
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "chevron.right")
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "더보기 ", attributes: font)
        completeText.append(attachmentString)
        plusComment.attributedText = completeText
        plusComment.font = UIFont.systemFont(ofSize: 15, weight: .light)
        plusComment.textColor = .lightGray
        plusComment.textAlignment = .left
        
        
        commentView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        
        commentViewLabel.text = "내가 쓴 댓글이 없어요."
        commentViewLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        commentViewLabel.textColor = .lightGray
        
    }
    
    func setLayout() {
      
        view.addSubview(collectionView)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: likeStoreView.topAnchor),
        collectionView.leadingAnchor.constraint(equalTo: likeStoreView.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo:  likeStoreView.trailingAnchor),
        collectionView.heightAnchor.constraint(equalTo:  likeStoreView.heightAnchor)
        ])
        
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumInteritemSpacing = 10
        collectionLayout.minimumLineSpacing = 10
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionLayout.itemSize = CGSize(width: 120, height: 80)
    }
    
    func setCollection() {
        collectionView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func setRegiLayout() {
      
        view.addSubview(regiCollectionView)
        regiCollectionView.showsHorizontalScrollIndicator = false
        regiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            regiCollectionView.topAnchor.constraint(equalTo: regiStoreView.topAnchor),
            regiCollectionView.leadingAnchor.constraint(equalTo: regiStoreView.leadingAnchor),
            regiCollectionView.trailingAnchor.constraint(equalTo:  regiStoreView.trailingAnchor),
            regiCollectionView.heightAnchor.constraint(equalTo:  regiStoreView.heightAnchor)
        ])
        
        regiCollectionLayout.scrollDirection = .horizontal
        regiCollectionLayout.minimumInteritemSpacing = 10
        regiCollectionLayout.minimumLineSpacing = 10
        regiCollectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        regiCollectionLayout.itemSize = CGSize(width: 120, height: 80)
    }
    
    func setRegiCollection() {
        regiCollectionView.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        regiCollectionView.dataSource = self
        regiCollectionView.register(MyRegistrationCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
}
