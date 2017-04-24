//
//  extensions.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 25/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
     func secondaryColor() -> UIColor{
        return UIColor(red:0.03, green:0.38, blue:0.59, alpha:1.0)
        
    }
     func primaryColor() -> UIColor{
        return UIColor(red:0.31, green:0.57, blue:0.82, alpha:1.0)
    }
}

public extension UIView {
    
    func roundify_circle() {
        self.layer.cornerRadius = self.frame.height/2
    }
    
    func roundify_slight() {
        self.layer.cornerRadius = 10.0
    }
    
}

extension Float {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
    
    var cleanUpper:String {
        if rint(self) == self {
            return String(Int(self))
        }
        else{
            return String(Float(self))
        }
    }
    
}
