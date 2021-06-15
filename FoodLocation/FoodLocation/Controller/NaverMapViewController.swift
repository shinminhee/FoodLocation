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
    let spotManager = CLLocationManager()
    var currentLatitude: Double = 0
    var currentLongtitude: Double = 0
    let searchView = CustomView()
    let searchViewBackImage = UIImageView()
    let searchViewImage = UIImageView()
    let searchViewLabel = UILabel()
    weak var delegate: NaverMapViewControllerDelegate?
    let spotImage = UIImageView()
    var spotLatitude: String = ""
    var spotLongtitude: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: currentLatitude, lng: currentLongtitude))
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        self.mapView.moveCamera(cameraUpdate)
        setNaverMap()
        setupLocationManager()
        setUI()
        setCamera()
        setSearchView()
        setSpot()
        locationManager
    }
    @objc
    func searchBarTaped(_ sender: UITapGestureRecognizer) {
        let locationVC = LocationInTableViewController()
        self.present(locationVC, animated: true, completion: nil)
        
    }
    @objc
    func okButtonTapped(_ sender : UIButton) {
        guard let text = addressLabel.text else { return }
        self.delegate?.textFieldInput(text: text)
        print(text)
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

protocol NaverMapViewControllerDelegate: class {
    func textFieldInput(text: String)
    
}

extension NaverMapViewController: CLLocationManagerDelegate {
   
    //            print("latitude" + String(coor.latitude) + "/ longitude" + String(coor.longitude))
    //            let ceo: CLGeocoder = CLGeocoder()
    //            currentLatitude = coor.latitude
    //            currentLongtitude = coor.longitude
    //            let loc: CLLocation = CLLocation(latitude: currentLatitude, longitude: currentLongtitude)
    //            ceo.reverseGeocodeLocation(loc, completionHandler:
    //                                        {(placemarks, error) in
    //                                            if (error != nil)
    //                                            {
    //                                                print("reverse geodcode fail: \(error!.localizedDescription)")
    //                                            }
    //                                            let pm = placemarks! as [CLPlacemark]
    //
    //                                            if pm.count > 0 {
    //                                                let pm = placemarks![0]
    //                                                print(pm.country)
    //                                                print(pm.locality)
    //                                                print(pm.thoroughfare)
    //                                                print(pm.postalCode)
    //                                                print(pm.subThoroughfare)
    //                                                var addressString : String = ""
    //                                                if pm.country != nil {
    //                                                    addressString = addressString + pm.country! + ", "
    //                                                }
    //                                                if pm.locality != nil {
    //                                                    addressString = addressString + pm.locality! + ", "
    //                                                }
    //                                                if pm.thoroughfare != nil {
    //                                                    addressString = addressString + pm.thoroughfare! + ", "
    //                                                }
    //                                                if pm.postalCode != nil {
    //                                                    addressString = addressString + pm.postalCode! + " "
    //                                                }
    //
    //                                                self.addressLabel.text = addressString
    //                                            }
    //                                        })
    //        }
    //    }
    
    
}

extension NaverMapViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLatitude = locations.last!.coordinate.latitude
        currentLongtitude = locations.last!.coordinate.longitude
        if let coor = manager.location?.coordinate {
            
            let ceo: CLGeocoder = CLGeocoder()
            currentLatitude = coor.latitude
            currentLongtitude = coor.longitude
            let loc: CLLocation = CLLocation(latitude: coor.latitude, longitude: coor.longitude) // 이거 mapAndStore뷰컨으로 보내야됨
            ceo.reverseGeocodeLocation(loc, completionHandler:
                                        {(placemarks, error) -> Void in
                                            if error != nil {
                                                NSLog("\(error)")
                                                return
                                            }
                                            let coord = NMGLatLng(lat: self.currentLatitude, lng: self.currentLongtitude)
                                            let cameraUpdate = NMFCameraUpdate(scrollTo: coord)

//                                            cameraUpdate.animation = .fly
//                                            cameraUpdate.animationDuration = 1
//                                            self.mapView.positionMode = .direction
                                            self.mapView.moveCamera(cameraUpdate)
                                            guard let placemark = placemarks?.first,
                                                  let addrList = placemark.addressDictionary?["FormattedAddressLines"] as? [String] else {
                                                return
                                            }
                                            let address = addrList.joined(separator: " ")
                                            self.addressLabel.text = address
                                        })
        }
    }
    
    
    func setSpot() {
        mapView.addSubview(spotImage)
        spotImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spotImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spotImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spotImage.widthAnchor.constraint(equalToConstant: 50),
            spotImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        spotImage.backgroundColor = .clear
        spotImage.image = UIImage(named: "spot")
        
    }
    //
    //        let address = CLGeocoder()
    //        var lat: Double = 0
    //        var lng: Double = 0
    //        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
    //        lat = center.latitude
    //        lng = center.longitude
    //        self.locationManager(self.spotManager, didUpdateLocations: [CLLocation(latitude: lat, longitude: lng)])
    //        self.getAddressFromLatLon(pdblLatitude: "\(lat)", withLongitude: "\(lng)")
    //
    //        address.geocodeAddressString(addressLabel.text ?? "", completionHandler: { placemarks, error in
    //            guard let placemark = placemarks?.first!, let location = placemark.location else { return }
    //            print(location)
    //            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
    //            lat = center.latitude
    //           lng = center.longitude
    //            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat, lng: lng))
    //            cameraUpdate.animation = .fly
    //            cameraUpdate.animationDuration = 1
    //            self.mapView.moveCamera(cameraUpdate)
    //
    //        })
    
    //
    //    func convertToAddressWith(coordinate: CLLocation) {
    //        let geoCoder = CLGeocoder()
    //        geoCoder.reverseGeocodeLocation(coordinate) { (placemarks, error) -> Void in
    //            if error != nil {
    //                NSLog("\(error)")
    //                return
    //            }
    //            guard let placemark = placemarks?.first,
    //                  let addrList = placemark.addressDictionary?["FormattedAddressLines"] as? [String] else {
    //                return
    //            }
    //            let address = addrList.joined(separator: " ")
    //            print(address)
    //        }
    //    }
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
    
    // 현재위치 설정 델리게이트
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 배터리에 맞게 권장되는 최적의 정확도
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    
    func setNaverMap() {
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
