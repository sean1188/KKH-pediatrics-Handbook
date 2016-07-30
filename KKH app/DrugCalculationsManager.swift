/**
//
//  CalculationsManager.swift
//  Handbook
//
//  Created by Ravern on 9/6/16.
//  Copyright © 2016 SST Inc. All rights reserved.
//

import UIKit
import MessageUI

class DrugCalculationsManager: NSObject, MFMailComposeViewControllerDelegate {
    
    var weight: Int = -1
    var emailData: String = ""

    let multipliers = [
        3 : 50,
        4 : 50,
        5: 300,
        6: 3,
        7: 10,
        8: 10,
        9: 0.1,
        10: 0.02,
        11: 1,
        12: 0.2,
        13: 50,
        14: 1,
        
        16: 5,
        17: 15,
        18: 0.1,
        19: 0.2,
        
        21: 0.5,
        22: 1,
        23: 4,
        
        25: 0.3,
        26: 3,
        
        28: 30,
        29: 15,
        30: 1,
        31: 3,
        
        33: 15,
        
        35: 50,
        
        
        38: 1,
        
        40: 10,
        
        42: 3,
        43: 250,
        44: 25
    ]
    
    init(jeff: Int) {
        super.init()
        NSLog("test");
        self.weight = jeff
        if let path = NSBundle.mainBundle().pathForResource("DrugList", ofType: "csv") {
            do {
                let data = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                var dataLines = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
                dataLines[1] = dataLines[1].stringByReplacingOccurrencesOfString("XX", withString: "\(jeff)")
                for i in 3 ..< dataLines.count {
                    if multipliers[i] != nil {
                        dataLines[i] = dataLines[i].stringByReplacingOccurrencesOfString("XX", withString: "\(Double(jeff) * multipliers[i]!)")
                    }
                }
                
                printLines(dataLines)
                for i in 0 ..< dataLines.count {
                    emailData = emailData.stringByAppendingString("\(dataLines[i])\n")
                }
            } catch {
                
            }
        }
    }
    func sendEmail(sender: UIViewController) {
        //
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = self
        vc.setSubject("Drug Table")
        vc.setMessageBody("Attached is the list of drugs for patient of \(weight)kg weight.", isHTML: false)
        //lmao nsuserdef
        let def = NSUserDefaults.standardUserDefaults()
        def.setObject(emailData, forKey: "drugData")
        vc.addAttachmentData(emailData.dataUsingEncoding(NSUTF8StringEncoding)!, mimeType: "text/csv", fileName: "Drug_table.csv")
        
        sender.presentViewController(vc, animated: true) { 
            
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func printLines(array: [String]) {
        for i in 0 ..< array.count {
            print(array[i])
        }
    }
}
*/

//
//  CalculationsManager.swift
//  Handbook
//
//  Created by Ravern on 9/6/16.
//  Copyright © 2016 SST Inc. All rights reserved.
//

import UIKit
import MessageUI

class DrugCalculationsManager: NSObject, MFMailComposeViewControllerDelegate {
    
    var weight: Int = -1
    var emailData: String = ""
    
    let multipliers = [
        3 : 50,
        4 : 50,
        5: 300,
        6: 3,
        7: 10,
        8: 10,
        9: 0.1,
        10: 0.02,
        11: 1,
        12: 0.2,
        13: 50,
        14: 1,
        
        16: 5,
        17: 15,
        18: 0.1,
        19: 0.2,
        
        21: 0.5,
        22: 1,
        23: 4,
        
        25: 0.3,
        26: 3,
        
        28: 30,
        29: 15,
        30: 1,
        31: 3,
        
        33: 15,
        
        35: 50,
        
        
        38: 1,
        
        40: 10,
        
        42: 3,
        43: 250,
        44: 25
    ]
    
    init(weight: Int) {
        super.init()
        
        self.weight = weight
        
        if let path = NSBundle.mainBundle().pathForResource("DrugList", ofType: "csv") {
            do {
                let data = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                var dataLines = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
                dataLines[1] = dataLines[1].stringByReplacingOccurrencesOfString("XX", withString: "\(weight)")
                for i in 3 ..< dataLines.count {
                    if multipliers[i] != nil {
                        dataLines[i] = dataLines[i].stringByReplacingOccurrencesOfString("XX", withString: "\(Double(weight) * multipliers[i]!)")
                    }
                }
                
                printLines(dataLines)
                for i in 0 ..< dataLines.count {
                    emailData = emailData.stringByAppendingString("\(dataLines[i])\n")
                }
            } catch {
                
            }
        }
    }
    
    func sendEmail(sender: UIViewController) {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = self
        vc.setSubject("Drug Table")
        vc.setMessageBody("Attached is the list of drugs for patient of \(weight)kg weight.", isHTML: false)
        vc.addAttachmentData(emailData.dataUsingEncoding(NSUTF8StringEncoding)!, mimeType: "text/csv", fileName: "Drug_table.csv")
        
        sender.presentViewController(vc, animated: true) {
            
        }
    }
    
    func getData() -> NSData? {
        return emailData.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: {
            
        })
    }
    
    func printLines(array: [String]) {
        for i in 0 ..< array.count {
            print(array[i])
        }
    }
}