//
//  SideMenuCell.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit

class SideMenuCell : UICollectionViewCell {
    lazy var icon : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var iconLabel : UILabel = {
        let textLbl = UILabel()
        textLbl.textColor = .jungleGreen
        textLbl.font = UIFont(name: "OpenSans-SemiBold", size: 24 * appConstant.heightRatio)
        textLbl.textAlignment = .left
        textLbl.numberOfLines = 0
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        return textLbl
    }()
    
    static var identifier: String = "MenuCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    func setupCell(){
        self.addSubview(icon)
        self.addSubview(iconLabel)
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 26 * appConstant.widthRatio),
            icon.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            icon.widthAnchor.constraint(equalToConstant: 26 * appConstant.widthRatio),
            
            iconLabel.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            iconLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 30 * appConstant.widthRatio),
            iconLabel.heightAnchor.constraint(equalToConstant: 33 * appConstant.heightRatio),
        ])
    }
}
