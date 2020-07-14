//
//  WebViewController.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController : NavbarController, WKNavigationDelegate {
    var urlString = String()
    let Activity =  UIActivityIndicatorView(style:.large)
    lazy var webView : WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
       
        return wv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Activity.frame = CGRect(x: 170 * appConstant.widthRatio, y: 300 * appConstant.heightRatio, width: 80, height: 80)
             leftButton.isHidden = false
        leftButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        sideMenuButton.isHidden = true
        rightImage.isHidden = true
         webView.navigationDelegate = self
         let url = URL(string: urlString)!
         webView.load(URLRequest(url: url))
         webView.allowsBackForwardNavigationGestures = true
      
           self.Activity.startAnimating()
          
           self.Activity.hidesWhenStopped = true
         setupUI()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Activity.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Activity.stopAnimating()
    }
   func  setupUI()
     {
        
        mainView.addSubview(webView)
        mainView.addSubview(Activity)
        
      
       
            NSLayoutConstraint.activate([
             
            webView.topAnchor.constraint(equalTo: mainView.topAnchor),
            webView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            
        ])
            
}
    @objc func back(){
     
             let rootViewController = getCurrentViewController()
        let controller = HomeController()
        controller.modalPresentationStyle = .fullScreen

             rootViewController?.present(controller, animated: true, completion: nil)
             
              

          }
    
    func getCurrentViewController() -> UIViewController? {
           let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
           if let rootController = keyWindow?.rootViewController {
                 var currentController: UIViewController! = rootController
                 while( currentController.presentedViewController != nil ) {
                     currentController = currentController.presentedViewController
                 }
                 return currentController
             }
             return nil

         }
}
