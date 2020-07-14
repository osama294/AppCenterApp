//
//  UIColorExtension.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {

  @nonobjc class var whiteShade: UIColor {
    return UIColor(red: 252.0 / 255.0, green: 250.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
  }
    @nonobjc class var pale: UIColor {
       return UIColor(red: 250.0 / 255.0, green: 243.0 / 255.0, blue: 221.0 / 255.0, alpha: 1.0)
     }
    @nonobjc class var jungleGreen: UIColor {
      return UIColor(red: 1.0 / 255.0, green: 105.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var black4: UIColor {
      return UIColor(white: 0.0, alpha: 0.04)
    }
    @nonobjc class var dirtyOrange: UIColor {
       return UIColor(red: 222.0 / 255.0, green: 125.0 / 255.0, blue: 19.0 / 255.0, alpha: 1.0)
     }
    @nonobjc class var waterBlue: UIColor {
       return UIColor(red: 23.0 / 255.0, green: 148.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
     }

}


extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.04,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 1.5,
    spread: CGFloat = 0)
  {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: 3, height: 3)
    shadowRadius = 0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}

