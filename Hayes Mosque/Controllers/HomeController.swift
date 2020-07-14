//
//  ViewController.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class HomeController : NavbarController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    lazy var homeView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let  collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var collectionView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var announcementLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Announcements"
        lbl.textColor = UIColor.dirtyOrange
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "OpenSans-Bold", size: 24 * appConstant.heightRatio)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var seeAllLabel : UILabel = {
        let lbl = UILabel()
        let attributedString = NSMutableAttributedString.init(string: "See all")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length))
        lbl.attributedText = attributedString
        lbl.textColor = UIColor.waterBlue
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "OpenSans-Bold", size: 16 * appConstant.heightRatio)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    
    
    var urls : [String] = ["https://hayesmuslimcentre.org.uk/timetable/","https://hayesmuslimcentre.org.uk/madrasah","https://hayesmuslimcentre.org.uk/app-ia/","https://hayesmuslimcentre.org.uk/services","https://hayesmuslimcentre.org.uk/category/important-announcements/","https://hayesmuslimcentre.org.uk/upcoming-events/"]
    var homeImgName : [String] = ["timetable","madrassah","donations","services","announcements","upcoming"]
    var homeMainTitle : [String] = ["Timetable","Madrassah","Donations","Services","Announcements","Upcoming Events"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        homeView.backgroundColor = .clear
        homeView.delegate = self
        homeView.dataSource = self
        setupUI()
        
//        sideMenuView.register(SideMenuHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionheader")
//             sideMenuView.register(SideMenuCell.self, forCellWithReuseIdentifier: SideMenuCell.identifier)
//            sideMenuView.delegate = self
//                   sideMenuView.dataSource = self
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
//    func loadWebView(value : Int) {
//       switch value {
//            case 0:
//                 print("bc")
//                 navigationController?.pushViewController(HomeController(), animated: true)
//            case 1:
//                 webview.urlString = "https://hayesmuslimcentre.org.uk"
//                 navigationController?.pushViewController(webview, animated: true)
//            case 2:
//                  webview.urlString = "https://hayesmuslimcentre.org.uk/contact-us/"
//                navigationController?.pushViewController(webview, animated: true)
//            default:
//                print("Out of range")
//            }
//    }
    
    func setupUI()
    {
        mainView.addSubview(collectionView)
        collectionView.addSubview(homeView)


        NSLayoutConstraint.activate([
            
            homeView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor , constant: 24 * appConstant.widthRatio),
            homeView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor , constant: -24 * appConstant.widthRatio),
            homeView.topAnchor.constraint(equalTo: collectionView.topAnchor , constant: 19 * appConstant.heightRatio),
            homeView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            
            
            
            collectionView.widthAnchor.constraint(equalToConstant: 414 * appConstant.widthRatio),
            collectionView.heightAnchor.constraint(equalToConstant: 788 * appConstant.heightRatio),
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor
                ,constant: 127 * appConstant.heightRatio),
        
  
            
        ])
        
        
    }

    
     func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
    
              return urls.count
           
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    

        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        let data = self.homeMainTitle[indexPath.item]
        let imgdata = self.homeImgName[indexPath.item]
        menuCell.iconLabel.text = data
        let  image = UIImage(named: imgdata)
        menuCell.icon.image = image
         return menuCell
        
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
    
    
     let webview = WebViewController()
    
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let rootViewController = getCurrentViewController()
        webview.urlString = urls[indexPath.row]
    webview.modalPresentationStyle = .fullScreen
    rootViewController?.present(webview, animated: true, completion: nil)
    }
    
  func numberOfSections(in collectionView: UICollectionView) -> Int {  return 1 }
    

}

extension  HomeController : UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView,
                                  layout collectionViewLayout: UICollectionViewLayout,
                                  sizeForItemAt indexPath: IndexPath) -> CGSize {
    
                  
                  return CGSize(width: 175 * appConstant.widthRatio, height: 211 * appConstant.heightRatio )
              
        

    }
}
    

