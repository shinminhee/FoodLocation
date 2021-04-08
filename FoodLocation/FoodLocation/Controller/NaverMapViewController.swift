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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        setNaverMap()
        let locationOverlay = mapView.locationOverlay
        locationOverlay.hidden = true
        locationOverlay.location = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        locationOverlay.heading = 90
        locationOverlay.icon = NMFOverlayImage(name: "location_overlay_icon")
        locationOverlay.iconWidth = 20
        locationOverlay.iconHeight = 20
        locationOverlay.iconWidth = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
        locationOverlay.iconHeight = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
        locationOverlay.anchor = CGPoint(x: 0.5, y: 1)
    }
    

}
extension NaverMapViewController {
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
    
 
}
