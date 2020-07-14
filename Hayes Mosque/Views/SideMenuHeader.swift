//
//  SideMenuHeader.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit

class SideMenuHeader : UICollectionReusableView {
    
    lazy var headerImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "layer2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupHeader()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader(){
        self.addSubview(headerImage)
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 224 * appConstant.heightRatio),
            headerImage.heightAnchor.constraint(equalToConstant: 68 * appConstant.heightRatio),
            headerImage.widthAnchor.constraint(lessThanOrEqualToConstant: 171 * appConstant.widthRatio),
            headerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24 * appConstant.widthRatio),
            headerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 100 * appConstant.heightRatio),
        ])
    }
}
