//
//  LocationViewController.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit
import WebKit

class LocationViewController: UIViewController {
    
    var webView: WKWebView?
    let indicator = UIActivityIndicatorView(style: .medium)
    var address = ""
    let contentController = WKUserContentController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
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

extension LocationViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if let data = message.body as? [String: Any] {
            address = data["roadAddress"] as? String ?? ""
        }
        guard let tabBarController = presentingViewController as? UITabBarController else { return }
        guard let firstVC = tabBarController.viewControllers?.first as? ViewController else { return }
        firstVC.searchViewLabel.text = address
        self.dismiss(animated: true, completion: nil)
        

    }
}

extension LocationViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}
