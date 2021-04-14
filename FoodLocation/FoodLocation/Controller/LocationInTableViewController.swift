//
//  LocationInTableViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/14.
//

import UIKit
import WebKit
import MapKit
import NMapsMap

class LocationInTableViewController: UIViewController {
    
    var webView: WKWebView?
    let indicator = UIActivityIndicatorView(style: .medium)
    var address = ""
    let contentController = WKUserContentController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        contentController.add(self, name: "callBackHandler")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView?.navigationDelegate = self
        
        guard let url = URL(string: "https://shinminhee.github.io/FoodLocation/"),
              let webView = webView
        else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        indicator.startAnimating()
        
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            indicator.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: webView.centerYAnchor),
        ])
        
    }
    
    
}

extension LocationInTableViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if let data = message.body as? [String: Any] {
            address = data["roadAddress"] as? String ?? ""
        }

        guard let naverMapVC = presentingViewController as? NaverMapViewController else { return }
        print(type(of: presentingViewController))
    
        naverMapVC.addressLabel.text = address
        self.dismiss(animated: true) {
            let address = CLGeocoder()
            var lat: Double = 0
            var lng: Double = 0
            address.geocodeAddressString(naverMapVC.addressLabel.text ?? "", completionHandler: { placemarks, error in
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
                marker.mapView = naverMapVC.mapView
                let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat, lng: lng))
                cameraUpdate.animation = .fly
                cameraUpdate.animationDuration = 1
                naverMapVC.mapView.moveCamera(cameraUpdate)
                
            })
        }
        
        
    }
}

extension LocationInTableViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}
