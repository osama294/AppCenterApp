//
//  NavbarController.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit
class NavbarController : UIViewController{
    
    lazy var topView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var navbarView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    lazy var mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dimView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var rightImage : UIImageView = {
           let iv = UIImageView()
           iv.image = UIImage(named: "layer2")
           iv.translatesAutoresizingMaskIntoConstraints = false
           iv.contentMode = .scaleAspectFit
           return iv
       }()
    
    lazy var sideMenuButton : UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "openMenu")
        btn.setImage(img, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(showSideMenu), for: .touchUpInside)
        return btn
    }()
    
    lazy var sideMenuView : SideMenuView = {
        let view = SideMenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var leftButton : UIButton = {
        let img = UIImage(named:"btnBackNormal")
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(img, for: .normal)
        btn.imageView?.contentMode  = .scaleAspectFit
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    var translate : CGFloat = 0
    var leadAnchorVal:CGFloat = -338 * appConstant.widthRatio
    var leadingAnchor : NSLayoutConstraint!
    var sideMenuOpen = false
    var gesture : UITapGestureRecognizer?
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        setupView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        tapGesture.delegate = self
        dimView.addGestureRecognizer(tapGesture)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupView()
    {
        self.view.addSubview(topView)
        self.view.addSubview(navbarView)
        self.view.addSubview(mainView)
        self.view.addSubview(dimView)
        dimView.addSubview(sideMenuView)
        navbarView.addSubview(sideMenuButton)
        navbarView.addSubview(leftButton)
        navbarView.addSubview(rightImage)
        leftButton.isHidden = true
        
        leadingAnchor = dimView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -414 * appConstant.widthRatio)
        leadingAnchor.isActive = true
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: self.view.topAnchor),
            topView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            topView.heightAnchor.constraint(equalToConstant: 44 * appConstant.heightRatio),
            
            navbarView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            navbarView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            navbarView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            navbarView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            mainView.topAnchor.constraint(equalTo: navbarView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            rightImage.centerYAnchor.constraint(equalTo:navbarView.centerYAnchor),
            rightImage.trailingAnchor.constraint(equalTo: navbarView.trailingAnchor, constant: -24 * appConstant.widthRatio),
            rightImage.heightAnchor.constraint(equalToConstant: 58 * appConstant.heightRatio),
            rightImage.widthAnchor.constraint(equalToConstant: 145.8529411815 * appConstant.widthRatio),
            sideMenuButton.centerYAnchor.constraint(equalTo: navbarView.centerYAnchor),
            sideMenuButton.leadingAnchor.constraint(equalTo: navbarView.leadingAnchor, constant: 24 * appConstant.widthRatio),
            sideMenuButton.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            sideMenuButton.widthAnchor.constraint(equalToConstant: 27 * appConstant.heightRatio),
            
            leftButton.centerYAnchor.constraint(equalTo: navbarView.centerYAnchor),
            leftButton.leadingAnchor.constraint(equalTo: navbarView.leadingAnchor, constant: 14 * appConstant.widthRatio),
            leftButton.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            leftButton.widthAnchor.constraint(equalToConstant: 27 * appConstant.widthRatio),
            
            sideMenuView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            sideMenuView.widthAnchor.constraint(equalToConstant: 338 * appConstant.widthRatio),
            sideMenuView.topAnchor.constraint(equalTo: dimView.topAnchor),
            sideMenuView.leadingAnchor.constraint(equalTo: dimView.leadingAnchor),
            
            dimView.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            dimView.widthAnchor.constraint(equalToConstant: 414 * appConstant.widthRatio),
        ])
    }
    
    @objc private func onTap(_ gesture: UIGestureRecognizer) {
        
        if (gesture.state == .ended) {
            if (sideMenuOpen == true) {let originalTransform = self.dimView.transform
                UIView.animate(withDuration: 0.5, delay:0.1 , options:.curveEaseInOut , animations: {
                    self.dimView.transform = originalTransform.translatedBy(x: -414 * appConstant.widthRatio, y: 0)
                    self.sideMenuOpen = false
                })}
        }
    }
    
    func hideMenu() {
        if (sideMenuOpen == true)   {let originalTransform = self.dimView.transform
            UIView.animate(withDuration: 0.5, delay:0.1 , options:.curveEaseInOut , animations: {
                self.dimView.transform = originalTransform.translatedBy(x: -414 * appConstant.widthRatio, y: 0)
                self.sideMenuOpen = false
            })}
        
    }
    @objc func showSideMenu(){
        if(sideMenuOpen == false){
            let originalTransform = self.dimView.transform
            UIView.animate(withDuration: 0.5, delay:0.1 , options:.curveEaseInOut , animations: {
                self.dimView.transform = originalTransform.translatedBy(x: 414 * appConstant.widthRatio, y: 0)
            })
            sideMenuOpen = true
        }
    }
}

extension NavbarController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
    func handleTapOffModal(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
