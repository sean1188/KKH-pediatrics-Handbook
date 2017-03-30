
//
//  CommonDrugCalculationsManager.swift
//  KKH app
//
//  Created by sean on 8/3/17.
//  Copyright © 2017 tangentinc. All rights reserved.
//

import UIKit
import SwiftyJSON

class CommonDrugCalculationsManager : NSObject {

    public static func loadData(weight: Float) -> [String: [String: [String: Any]]]! {
    
        // This will load shit from the file.
        do {
            var returnValue: [String: [String: [String: [String: Any]]]] = [:]
            let content = try String(contentsOfFile: Bundle.main.path(forResource: "CommonDrugs", ofType: "json")!)
            let json = JSON(parseJSON: content)
            for (key, jsonValue) in json {
                returnValue[key] = [:]
                for (key2, jsonValue2) in jsonValue {
                    if key2 == "name" { continue }
                    for (key3, jsonValue3) in jsonValue2 {
                        returnValue[key]![key3] = [:]
                        for (key4, jsonValue4) in jsonValue3 {
                            if key4 == "name" { continue }
                            for (key5, jsonValue5) in jsonValue4 {
                                returnValue[key]![key3]![key5] = [:]
                                for (key6, jsonValue6) in jsonValue5 {
                                    if key6 == "name" { continue }
                                    if let float = jsonValue6.float {
                                        returnValue[key]![key3]![key5]![key6] = float
                                    } else if let string = jsonValue6.string {
                                        returnValue[key]![key3]![key5]![key6] = string
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return returnValue
        } catch _ {}
        return nil
    }
 
}
