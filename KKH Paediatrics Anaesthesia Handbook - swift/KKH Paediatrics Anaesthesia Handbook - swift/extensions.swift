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
    
    var roundify_circle: UIView {
        self.layer.cornerRadius = self.frame.height/2
        return self
    }
    
    var roundify_slight: UIView {
        self.layer.cornerRadius = 10.0
        return self
    }
    
}
