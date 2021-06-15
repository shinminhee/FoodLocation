//
//  ViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {
    
    let mapView = NMFMapView()
    let locationManager = CLLocationManager()
    let searchView = CustomView()
    let searchViewBackImage = UIImageView()
    let searchViewImage = UIImageView()
    let searchViewLabel = UILabel()
    let locationButton = UIButton()
    var currentLatitude: Double = 0
    var currentLongtitude: Double = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        setUI()
        setSearchView()
        setupLocationManager()
        setCamera()

    }
    
    @objc
    func locationButtonTaped(_ sender: UIButton) {
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: currentLatitude, lng: currentLongtitude))
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        self.mapView.moveCamera(cameraUpdate)
    }
    
    @objc
    func searchBarTaped(_ sender: UITapGestureRecognizer) {
        let locationVC = LocationViewController()
        self.present(locationVC, animated: true, completion: nil)
        
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLatitude = locations.last!.coordinate.latitude
        currentLongtitude = locations.last!.coordinate.longitude
    }
    
}


extension ViewController {
    func setupLocationManager() {
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization() //권한 요청
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.distanceFilter = kCLDistanceFilterNone
    locationManager.startUpdatingLocation()
    }
    
    func setCamera() {
       
    }
    private func setUI() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.positionMode = .direction
        mapView.positionMode = .compass
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    func setSearchView() {
        view.addSubview(searchView)
        [searchView, searchViewLabel, searchViewImage, searchViewBackImage, locationButton].forEach { (view) in
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
            searchViewBackImage.widthAnchor.constraint(equalToConstant: 30),
            
            locationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            locationButton.heightAnchor.constraint(equalToConstant: 60),
            locationButton.widthAnchor.constraint(equalToConstant: 60),
            
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
        
        locationButton.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        locationButton.layer.cornerRadius = 30
        locationButton.setImage(UIImage(systemName: "scope"), for: .normal)
        locationButton.tintColor = UIColor.gray
        locationButton.addTarget(self, action: #selector(locationButtonTaped(_:)), for: .touchUpInside)
    
    }
    
    
    
}

//func setMarker() {
//        let marker = NMFMarker()
//        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
//        marker.iconImage = NMF_MARKER_IMAGE_BLACK
//        marker.iconTintColor = UIColor.red
//        marker.width = 50
//        marker.height = 50
//        marker.mapView = mapView
//
//        // 정보창 생성
//        let infoWindow = NMFInfoWindow()
//        let dataSource = NMFInfoWindowDefaultTextSource.data()
//        dataSource.title = "서울특별시청"
//        infoWindow.dataSource = dataSource
//
//        // 마커에 달아주기
//        infoWindow.open(with: marker)
//    }
