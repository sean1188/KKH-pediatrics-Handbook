//
//  DataObject.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 31/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import Foundation


class DataObject
{
    let name : String
    var children : [DataObject]
    
    init(name : String, children: [DataObject]) {
        self.name = name
        self.children = children
    }
    
    convenience init(name : String) {
        self.init(name: name, children: [DataObject]())
    }
    
    func addChild(_ child : DataObject) {
        self.children.append(child)
    }
    
    func removeChild(_ child : DataObject) {
        self.children = self.children.filter( {$0 !== child})
    }
}

