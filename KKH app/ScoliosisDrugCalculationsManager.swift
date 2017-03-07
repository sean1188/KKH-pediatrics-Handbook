//
//  ScoliosisDrugCalculationsManager.swift
//  Handbook
//
//  Created by Ravern on 26/2/17.
//  Copyright © 2017 SST Inc. All rights reserved.
//

import UIKit
import MessageUI

class ScoliosisDrugCalculationsManager: NSObject, MFMailComposeViewControllerDelegate {
    
    var weight: Int = -1
    var emailData: String = ""
    
    let firstIndex = 4
    let multipliers = [
        
        
        
        
        
        
        7: 20.0,
        8: 2.0,
        9: 0.5,
        10: 30.0,
        11: 0.1,
        12: 0.2,
        13: 0.05,
        
        
        
        
        
        
        20: 50.0,
        
        
        
        24: 2,
        25: 2,
        
        
        
        29: 2,
    ]
    var dataLines: [String]!
    
    init(weight: Int) {
        super.init()
        
        self.weight = weight
        
        if let path = Bundle.main.path(forResource: "ScoliosisDrugList", ofType: "csv") {
            do {
                let data = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                dataLines = data.components(separatedBy: CharacterSet.newlines)
                for dataLine in dataLines {
                    if dataLine == "" {
                        dataLines.remove(at: dataLines.index(of: dataLine)!)
                    }
                }
                dataLines[2] = dataLines[2].replacingOccurrences(of: "XX", with: "\(weight)")
                for i in 4 ..< dataLines.count {
                    if multipliers[i + 1] != nil {
                        dataLines[i] = dataLines[i].replacingOccurrences(of: "XX", with: "\(Double(weight) * multipliers[i + 1]!)")
                    }
                }
                
                printLines(dataLines)
                for i in 0 ..< dataLines.count {
                    emailData = emailData + "\(dataLines[i])\n"
                }
            } catch {
                
            }
        }
    }
    
    func sendEmail(_ sender: UIViewController) {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = self
        vc.setSubject("Socliosis Drug Table")
        vc.setMessageBody("Attached is the list of scoliosis drugs for patient of \(weight)kg weight.", isHTML: false)
        vc.addAttachmentData(emailData.data(using: String.Encoding.utf8)!, mimeType: "text/csv", fileName: "Scoliosis_drug_table.csv")
        
        if !MFMailComposeViewController.canSendMail(){}
        else{
            sender.present(vc, animated: true) {
                
            }}
    }
    
    func printLines(_ array: [String]) {
        for i in 0 ..< array.count {
            print(array[i])
        }
    }
    
    func getData() -> Data? {
        return emailData.data(using: String.Encoding.utf8)!
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: {
            
        })
    }
}
