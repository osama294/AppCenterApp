//
//  SideMenuView.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit

class SideMenuView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    enum SideMenuOptions: String{
        case Home = "Home"
        case AboutUs = "About Us"
        case ContactUs = "Contact Us"
    }
    
    class Options: NSObject{
        let name: SideMenuOptions
        let imageName: String
        
        init(name: SideMenuOptions, imageName: String) {
            self.name = name
            self.imageName = imageName
        }
    }
    
    var menuOptions: [Options] = {
        
        return [Options.init(name: .Home, imageName: "homeIcon"), Options.init(name: .AboutUs, imageName: "aboutIcon"),Options.init(name: .ContactUs, imageName: "contactIcon")]
    }()
    
    lazy var sideMenu : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    lazy var menuView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let  collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.pale
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var menudata: [Int] = Array(0..<3)
    var menuImgName : [String] = ["homeIcon","aboutIcon","contactIcon"]
    var menuMainTitle : [String] = ["Home","About Us","Contact Us"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        menuView.register(SideMenuCell.self, forCellWithReuseIdentifier: SideMenuCell.identifier)
        menuView.register(SideMenuHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionheader")
        menuView.delegate = self
        menuView.dataSource = self
        setupSideMenu()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSideMenu(){
        self.addSubview(menuView)
        NSLayoutConstraint.activate([
            menuView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuView.topAnchor.constraint(equalTo: self.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return menuOptions.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: SideMenuCell.identifier, for: indexPath) as! SideMenuCell
        let data = self.menuMainTitle[indexPath.item]
        let imgdata = self.menuImgName[indexPath.item]
        menuCell.iconLabel.text = data
        let  image = UIImage(named: imgdata)
        menuCell.icon.image = image
        return menuCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"sectionheader", for: indexPath) as! SideMenuHeader
        return headerView
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {  return 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 224 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        handleNavigation(option: menuOptions[indexPath.row])
    }
    
    func handleNavigation(option: Options){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
        }, completion: { bool in
            switch option.name{
            case .Home:
                let rootController =  self.getCurrentViewController()
                let controller = HomeController()
                controller.modalPresentationStyle = .fullScreen
                rootController?.present( controller, animated: true, completion: nil)
                break
            case .AboutUs:
                print("about us")
                let rootController =  self.getCurrentViewController()
                let controller = WebViewController()
                controller.urlString =  "https://hayesmuslimcentre.org.uk/about-us/"
                controller.modalPresentationStyle = .fullScreen
                rootController?.present( controller, animated: true, completion: nil)
                break
                
            case .ContactUs:
                print("contact")
                let rootController =  self.getCurrentViewController()
                let controller = WebViewController()
                controller.urlString = "https://hayesmuslimcentre.org.uk/contact-us/"
                controller.modalPresentationStyle = .fullScreen
                rootController?.present( controller, animated: true, completion: nil)
                break
            }
        })
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
extension SideMenuView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 338 * appConstant.widthRatio, height: 81 * appConstant.heightRatio )
    }
}
