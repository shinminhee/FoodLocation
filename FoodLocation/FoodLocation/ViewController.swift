//
//  ViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    let searchView = CustomView()
    let searchViewBackImage = UIImageView()
    let searchViewImage = UIImageView()
    let searchViewLabel = UILabel()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
//        mapView.showsUserLocation = true
//        reRegion()
        setUI()
        setSearchView()
//        addAnnotation()
//        setupLocationManager()
        
        
    }
    
    
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
            searchViewBackImage.widthAnchor.constraint(equalToConstant: 30),
            searchViewBackImage.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            searchViewBackImage.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10)
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
//        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    
    // 내 위치 잡을때
    func reRegion() {
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 10, longitudinalMeters: 10)
        mapView.setRegion(region, animated: true)
    }
    
    //맵에서 위치 표시하는 화살표를 어노테이션 이라고 함
    func addAnnotation() {
        let annotation = MKPointAnnotation()
        //위도, 경도
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.85, longitude: -122.4194)
        //내 위치 찍을때
        annotation.coordinate = mapView.userLocation.coordinate
        annotation.title = "shin.mini"
        annotation.subtitle = "I'm here"
        mapView.addAnnotation(annotation)
        
    }
    
    @objc
    func searchBarTaped(_ sender: UITapGestureRecognizer) {
     let locationVC = LocationViewController()
        self.present(locationVC, animated: true, completion: nil)
        
        }
}

//extension ViewController: CLLocationManagerDelegate {
//
//}

//extension ViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//        addAnnotation()
//        reRegion()
//    }
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation { return nil } // 이거 안해주면 파란색 점 안 보이고 커피로 인식
//        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
//        annotationView.glyphText = "coffee"
//        annotationView.canShowCallout = true
//        annotationView.leftCalloutAccessoryView = createImageViewForAnnotation(annotationView: annotationView, imageName: "coffee") // 왼쪽에 사진 넣기
//        annotationView.rightCalloutAccessoryView = createImageViewForAnnotation(annotationView: annotationView, imageName: "coffee") // 오른쪽에 사진 넣기
//        return annotationView //
//
//    }
//}


extension ViewController {
    private func setUI() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          mapView.topAnchor.constraint(equalTo: view.topAnchor),
          mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

