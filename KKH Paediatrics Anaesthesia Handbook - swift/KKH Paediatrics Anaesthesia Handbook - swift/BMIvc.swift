//
//  BMIvc.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 29/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class BMIvc: UIViewController {

    @IBOutlet weak var backB: UIButton!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet var textfieldCollection: [UITextField]!
    
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var weightfield: UITextField!
    @IBOutlet weak var heightField: UITextField!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
   
    @IBAction func proceed(_ sender: Any) {
        textfieldCollection.forEach { (textfield) in
            if (textfield.text?.isEmpty)! {
                sendAlertController(title: "error", message: "Please fill up all fields")
            }
        }
    }

    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//MARK: - callables
    func style(){
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = backB.roundify_circle
        backB.tintColor = UIColor.init().secondaryColor()
        genderSegment.tintColor = UIColor.init().secondaryColor()
        textfieldCollection.forEach { (textfield) in
            textfield.backgroundColor = UIColor.init().secondaryColor()
            textfield.textColor = UIColor.white
        }
    }
    
    func sendAlertController (title : String, message : String){
        let a = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction.init(title: "Dismiss", style: .cancel, handler: nil))
        self.present(a, animated: true, completion: nil)
    }

}
