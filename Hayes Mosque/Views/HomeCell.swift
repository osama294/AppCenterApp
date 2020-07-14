//
//  homeCell.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit

class HomeCell : UICollectionViewCell {
    
    lazy var icon : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var iconLabel : UILabel = {
        let textLbl = UILabel()
        textLbl.textColor = .black
        textLbl.font = UIFont(name: "OpenSans-SemiBold", size: 20 * appConstant.heightRatio)
        textLbl.textAlignment = .center
        textLbl.numberOfLines = 0
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        return textLbl
    }()
    
    static var identifier: String = "homeCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        self.layer.cornerRadius = 12 * appConstant.heightRatio
        self.layer.applySketchShadow()
        self.layer.masksToBounds = false;
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
            icon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 48 * appConstant.heightRatio),
            icon.heightAnchor.constraint(equalToConstant: 77 * appConstant.heightRatio),
            icon.widthAnchor.constraint(equalToConstant: 77 * appConstant.widthRatio),
            
            iconLabel.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            iconLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 136 * appConstant.heightRatio),
            iconLabel.heightAnchor.constraint(equalToConstant: 33 * appConstant.heightRatio),
            
        ])
        
    }
    
    
}
