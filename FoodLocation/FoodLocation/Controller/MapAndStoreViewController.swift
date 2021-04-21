//
//  MapAndStoreViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/13.
//

// 가게이름, 위치, 주문음식, 상세 내용

import UIKit
import MapKit
import WebKit
import NMapsMap

class MapAndStoreViewController: UIViewController {
    
    let mapView = NMFMapView()
    let closeButton = UIImageView()
    let infoView = UIView()
    let redView = UIImageView()
    let mainView = UIView()
    let mainLabel = UILabel()
    let likeLabel = UILabel()
    
    let storeNameLabel = UILabel()
    let locationLabel = UILabel()
    let foodNameLabel = UILabel()
    let detailLabel = UILabel()
    
    var storeName = UILabel()
    var location = UILabel()
    var foodName = UILabel()
    var detail = UILabel()
    var isSelected = false
    weak var delegate: MapAndStoreViewControllerDelegate?
    var currentLatitude: Double = 0
    var currentLongtitude: Double = 0
    var address = ""
    let contentController = WKUserContentController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMap()
        setInfoView()
        setMainView()
        setCloseButton()
        contentController.add(self, name: "WKScriptMessageHandler")

    }
    @objc
    func closeTaped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    func likeLabelTap(_ sender: UITapGestureRecognizer) {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = isSelected ? UIImage(systemName: "heart") : UIImage(systemName: "heart.fill")
        let completeText = NSAttributedString(attachment: imageAttachment)
        let font = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let attachmentString = NSMutableAttributedString(string: "찜 ", attributes: font)
        attachmentString.append(completeText)
        likeLabel.attributedText = attachmentString
        likeLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        likeLabel.textAlignment = .right
        isSelected.toggle()
        if isSelected == true {
            MyStoreManager.shared.myStore.append("아무거나")
        } else {
            MyStoreManager.shared.myStore.removeAll() {
                $0 == "아무거나"
            }
        }
    
    }
}
protocol MapAndStoreViewControllerDelegate: class {
    func textFieldDidChangeSelection(_ textField: UITextField)
}

extension MapAndStoreViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let tableViewCell = presentingViewController as? RegistrationTableViewController else { return }
        guard let tableVC = tableViewCell.menuTableView.cellForRow(at: [1, 0]) as? RegistrationTableViewCell else { fatalError() }
        if let data = message.body as? [String: Any] {
            address = data[tableVC.locationTextField.text ?? ""] as? String ?? ""
        }
        tableVC.locationTextField.text = address
        self.dismiss(animated: true) {
            let address = CLGeocoder()
            var lat: Double = 0
            var lng: Double = 0
            address.geocodeAddressString(tableVC.locationTextField.text ?? "", completionHandler: { placemarks, error in
                guard let placemark = placemarks?.first!, let location = placemark.location else { return }
                print(location)
               lat = location.coordinate.latitude
               lng = location.coordinate.longitude
                let marker = NMFMarker()
                marker.position = NMGLatLng(lat: lat, lng: lng)
                marker.iconImage = NMF_MARKER_IMAGE_BLACK
                marker.iconTintColor = UIColor.red
                marker.width = 50
                marker.height = 50
                marker.mapView = self.mapView
                let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat, lng: lng))
                cameraUpdate.animation = .fly
                cameraUpdate.animationDuration = 1
                self.mapView.moveCamera(cameraUpdate)
                
            })
        }
        
        
    }
}

extension MapAndStoreViewController: RegistrationTableViewControllerDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            var number2 = textField.text ?? ""
            print(textField.text ?? "")
            
        //            guard let number1 = menuTableView.cellForRow(at: [0, 0]) as? RegistrationTableViewCell else { fatalError() }
        //            number1.storeTextField.text = textField.text
        //        case 2:
        //           var number2 = textField.text ?? ""
        //            print(textField.text ?? "")
        //        case 3:
        //           var number3 = textField.text ?? ""
        //            print(textField.text ?? "")
        //        case 4:
        //           var number4 = textField.text ?? ""
        //            print(textField.text ?? "")
        //        case 5:
        //           var number5 = textField.text ?? ""
        //            print(textField.text ?? "")
        
        default:
            fatalError()
        }
    }
    
    
}

extension MapAndStoreViewController {
   
    func setBottomView() {
        
    }
    func setCloseButton()  {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        closeButton.image = UIImage(systemName: "xmark")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(closeTaped(_:)))
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        closeButton.addGestureRecognizer(searchBarTaped)
        closeButton.isUserInteractionEnabled = true
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
        
        [storeName, storeNameLabel, location, locationLabel, detail, detailLabel, foodName, foodNameLabel].forEach { (view) in
            infoView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            storeNameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 100),
            storeNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            storeNameLabel.widthAnchor.constraint(equalToConstant: 200),
            storeNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            storeName.topAnchor.constraint(equalTo: storeNameLabel.bottomAnchor, constant: 10),
            storeName.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            storeName.widthAnchor.constraint(equalToConstant: 200),
            storeName.heightAnchor.constraint(equalToConstant: 40),
            
            locationLabel.topAnchor.constraint(equalTo: storeName.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            locationLabel.widthAnchor.constraint(equalToConstant: 200),
            locationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            location.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            location.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            location.widthAnchor.constraint(equalToConstant: 200),
            location.heightAnchor.constraint(equalToConstant: 40),
            
            detailLabel.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 20),
            detailLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            detailLabel.widthAnchor.constraint(equalToConstant: 200),
            detailLabel.heightAnchor.constraint(equalToConstant: 40),
            
            detail.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10),
            detail.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            detail.widthAnchor.constraint(equalToConstant: 200),
            detail.heightAnchor.constraint(equalToConstant: 40),
            
            foodNameLabel.topAnchor.constraint(equalTo: detail.bottomAnchor, constant: 20),
            foodNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            foodNameLabel.widthAnchor.constraint(equalToConstant: 200),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            foodName.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 10),
            foodName.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            foodName.widthAnchor.constraint(equalToConstant: 200),
            foodName.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        storeNameLabel.text = "가게 이름"
        storeNameLabel.backgroundColor = .red
        locationLabel.text = "위치"
        locationLabel.backgroundColor = .yellow
        detailLabel.text = "상세내용"
        detailLabel.backgroundColor = .blue
        foodNameLabel.text = "음식 이름"
        foodNameLabel.backgroundColor = .black
        
        storeName.font = UIFont.systemFont(ofSize: 15, weight: .light)
        location.font = UIFont.systemFont(ofSize: 15, weight: .light)
        detail.font = UIFont.systemFont(ofSize: 15, weight: .light)
        foodName.font = UIFont.systemFont(ofSize: 15, weight: .light)
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
        
        let searchBarTaped2 = UITapGestureRecognizer(target: self, action: #selector(likeLabelTap(_:)))
        //        searchBarTaped2.numberOfTouchesRequired = 1 // 손가락 수 설정
        //        searchBarTaped2.numberOfTapsRequired = 1 // 터치 수 설정 ex 더블클릭같은,,
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
