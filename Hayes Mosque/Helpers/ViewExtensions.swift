//
//  ViewExtensions.swift
//  HayesMuslimCentre
//
//  Created by OBS on 18/06/2020.
//  Copyright © 2020 OsamaShiraz. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func rightToLeftTransition(){
      let transition = CATransition()
      transition.duration = 0.5
      transition.type = CATransitionType.push
      transition.subtype = CATransitionSubtype.fromRight
      transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
      self.window!.layer.add(transition, forKey: kCATransition)
    }
    func leftToRightTransition(){
      let transition = CATransition()
      transition.duration = 0.5
      transition.type = CATransitionType.push
      transition.subtype = CATransitionSubtype.fromLeft
      transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
      self.window!.layer.add(transition, forKey: kCATransition)
    }
}

extension UIViewController {
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
    func backViewController() -> UIViewController? {
        if let stack = self.navigationController?.viewControllers {
            for i in (1..<stack.count).reversed() {
                if(stack[i] == self) {
                    return stack[i-1]
                }
            }
        }
        return nil
    }
}
extension UIView{
    @objc func toggleSideMenu(){
    let originalTransform = self.transform
          UIView.animate(withDuration: 0.5, delay:0.1 , options:.curveEaseInOut , animations: {
           self.transform = originalTransform.translatedBy(x: -338 * appConstant.widthRatio, y: 0)
           })
           
        
        
        
    }
}
