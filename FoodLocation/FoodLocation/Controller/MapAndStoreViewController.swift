//
//  MapAndStoreViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/13.
//

import UIKit
import NMapsMap

class MapAndStoreViewController: UIViewController {
    
    let mapView = NMFMapView()
    let infoView = UIView()
    let redView = UIImageView()
    let mainView = UIView()
    let mainLabel = UILabel()
    let likeLabel = UILabel()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMap()
        setInfoView()
        setMainView()
        
    }
    
    @objc
    func likeLabelTap(_ sender: UITapGestureRecognizer) {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "heart.fill")
        let completeText = NSAttributedString(attachment: imageAttachment)
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let attachmentString = NSMutableAttributedString(string: "찜 ", attributes: font)
        attachmentString.append(completeText)
        likeLabel.attributedText = attachmentString
        likeLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        likeLabel.textAlignment = .right
    }
    
    @objc
    func likeLabelTap2(_ sender: UITapGestureRecognizer) {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "heart")
        let completeText = NSAttributedString(attachment: imageAttachment)
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let attachmentString = NSMutableAttributedString(string: "찜 ", attributes: font)
        attachmentString.append(completeText)
        likeLabel.attributedText = attachmentString
        likeLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        likeLabel.textAlignment = .right
    }
    
    func setMap() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setInfoView() {
        view.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        infoView.backgroundColor = .white
    }
    
    func setMainView() {
        view.addSubview(mainView)
        [mainView, likeLabel, mainLabel].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainView.heightAnchor.constraint(equalToConstant: 150),
            
            mainLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            mainLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            mainLabel.widthAnchor.constraint(equalToConstant: 150),
            
            likeLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 80),
            likeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            likeLabel.widthAnchor.constraint(equalToConstant: 50),

            
        ])
        
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 20
        mainView.layer.shadowColor = UIColor.gray.cgColor
        mainView.layer.masksToBounds = false
        mainView.layer.shadowOffset = CGSize(width: 0, height: 4)
        mainView.layer.shadowRadius = 5
        mainView.layer.shadowOpacity = 0.3
        
        mainLabel.text = "맛있는 식당"
        mainLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(likeLabelTap(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        likeLabel.addGestureRecognizer(searchBarTaped)
        likeLabel.isUserInteractionEnabled = true
        
        let searchBarTaped2 = UITapGestureRecognizer(target: self, action: #selector(likeLabelTap2(_:)))
        searchBarTaped2.numberOfTouchesRequired = 1 // 손가락 수 설정
        searchBarTaped2.numberOfTapsRequired = 2 // 터치 수 설정 ex 더블클릭같은,,
        likeLabel.addGestureRecognizer(searchBarTaped2)
        likeLabel.isUserInteractionEnabled = true
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "heart")
        let completeText = NSAttributedString(attachment: imageAttachment)
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let attachmentString = NSMutableAttributedString(string: "찜 ", attributes: font)
        attachmentString.append(completeText)
        likeLabel.attributedText = attachmentString
        likeLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        likeLabel.textAlignment = .right
        
    }
  
    
    
}
