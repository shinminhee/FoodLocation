//
//  NaverMapViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/06.
//

import UIKit
import NMapsMap


class NaverMapViewController: UIViewController {

    
    let mapView = NMFMapView()
    let okButton = UIButton()
    let locationButton = UIButton()
    let addressLabel = UILabel()
    let infoLabel = UILabel()
    let locationManager = CLLocationManager()
    var currentLatitude: Double = 0
    var currentLongtitude: Double = 0
    let button = UIButton()
    let searchView = CustomView()
    let searchViewBackImage = UIImageView()
    let searchViewImage = UIImageView()
    let searchViewLabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        setNaverMap()
        setupLocationManager()
        setUI()
        setCamera()
        setSearchView()
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: currentLatitude, lng: currentLongtitude))
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        self.mapView.moveCamera(cameraUpdate)

    }
    @objc
    func searchBarTaped(_ sender: UITapGestureRecognizer) {
        let locationVC = LocationInTableViewController()
        self.present(locationVC, animated: true, completion: nil)
        
    }
    @objc
    func okButtonTapped(_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    @objc
    func locationButtonTaped(_ sender: UIButton) {
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: currentLatitude, lng: currentLongtitude))
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        self.mapView.moveCamera(cameraUpdate)
    
    }
}

extension NaverMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLatitude = locations.last!.coordinate.latitude
        currentLongtitude = locations.last!.coordinate.longitude
    }
}
extension NaverMapViewController {
    func setSearchView() {
        view.addSubview(searchView)
        [searchView, searchViewLabel, searchViewImage, searchViewBackImage].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            
            searchViewImage.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
            searchViewImage.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            searchViewImage.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10),
            searchViewImage.widthAnchor.constraint(equalToConstant: 30),
            
            searchViewLabel.leadingAnchor.constraint(equalTo: searchViewImage.trailingAnchor, constant: 10),
            
            searchViewLabel.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            searchViewLabel.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10),
            searchViewLabel.widthAnchor.constraint(equalToConstant: 200),
            
            searchViewBackImage.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -10),
            searchViewBackImage.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            searchViewBackImage.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10),
            searchViewBackImage.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        searchView.backgroundColor = .white
        let searchBarTaped = UITapGestureRecognizer(target: self, action: #selector(searchBarTaped(_:)))
        //        self.searchView.gestureRecognizers = [searchBarTaped]
        searchBarTaped.numberOfTouchesRequired = 1
        searchBarTaped.numberOfTapsRequired = 1
        searchView.addGestureRecognizer(searchBarTaped)
        searchView.isUserInteractionEnabled = true
        
        searchViewLabel.text = "어디에서 찾으세요?"
        //        searchViewLabel.textAlignment = .left
        searchViewLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        searchViewImage.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        searchViewBackImage.image = UIImage(systemName: "list.bullet")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
    
    }
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    func setNaverMap() {
            view.addSubview(mapView)
            view.addSubview(button)
            mapView.translatesAutoresizingMaskIntoConstraints = false
            mapView.positionMode = .direction
            mapView.positionMode = .compass
            NSLayoutConstraint.activate([
                mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mapView.topAnchor.constraint(equalTo: view.topAnchor),
                mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                
            ])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mapView.topAnchor.constraint(equalTo: view.topAnchor),
                mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                
            ])
            
            
        }
    func setCamera() {
       
    }
    
    func setUI() {
        [infoLabel, locationButton, addressLabel, okButton].forEach { (view) in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
            
            NSLayoutConstraint.activate([
                
                infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
                infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                infoLabel.widthAnchor.constraint(equalToConstant: 200),
                infoLabel.heightAnchor.constraint(equalToConstant: 30),
                
                locationButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 400),
                locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
                locationButton.heightAnchor.constraint(equalToConstant: 60),
                locationButton.widthAnchor.constraint(equalToConstant: 60),
                
                addressLabel.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 10),
                addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                addressLabel.widthAnchor.constraint(equalToConstant: 300),
                addressLabel.heightAnchor.constraint(equalToConstant: 60),
                
                okButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
                okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                okButton.widthAnchor.constraint(equalToConstant: 300),
                okButton.heightAnchor.constraint(equalToConstant: 60),
            
            ])
        
        
        infoLabel.backgroundColor = .white
        infoLabel.text = "지도를 움직여 위치를 설정하세요"
        infoLabel.layer.cornerRadius = 20
        infoLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        addressLabel.backgroundColor = .white

        okButton.setTitle("확인", for: .normal)
        okButton.setTitleColor(.black, for: .normal)
        okButton.layer.cornerRadius = 10
        okButton.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        okButton.layer.borderColor = UIColor.lightGray.cgColor
        okButton.layer.borderWidth = 0.3
        okButton.addTarget(self, action: #selector(okButtonTapped(_:)), for: .touchUpInside)
        okButton.layer.shadowColor = UIColor.gray.cgColor // 색깔
        okButton.layer.masksToBounds = false
        okButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        okButton.layer.shadowRadius = 5
        okButton.layer.shadowOpacity = 0.3
        
        locationButton.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        locationButton.layer.cornerRadius = 30
        locationButton.setImage(UIImage(systemName: "scope"), for: .normal)
        locationButton.tintColor = UIColor.gray
        locationButton.addTarget(self, action: #selector(locationButtonTaped(_:)), for: .touchUpInside)
    }
    
 
}
