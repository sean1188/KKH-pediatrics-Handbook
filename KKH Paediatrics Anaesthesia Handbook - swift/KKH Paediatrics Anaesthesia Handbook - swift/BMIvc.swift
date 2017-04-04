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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var bmi : Float = 0
    @IBAction func proceed(_ sender: Any) {
        var res = 0
        textfieldCollection.forEach { (textfield) in
            if (textfield.text?.isEmpty)! {
                res = res + 1
            }
        }
        switch res {
        case 0:
            //calculate
            let age = Int(ageField.text!)
             bmi = Float(weightfield.text!)! / (Float(heightField.text!)! * Float(heightField.text!)!)
            let ismale = (genderSegment.selectedSegmentIndex == 0) ? true : false
            let result = BMIGraphManager.init(age: age!, bmi: bmi, isMale: ismale).range()
            presentResult(result: result)
            break
        default:
            sendAlertController(title: "Error", message: "Please check that you have filled up all fields.")
            break
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - callables
    func style(){
        self.view.backgroundColor = UIColor.init().primaryColor()
		backB.roundify_circle()
        backB.tintColor = UIColor.init().secondaryColor()
        genderSegment.tintColor = UIColor.init().secondaryColor()
        textfieldCollection.forEach { (textfield) in
            textfield.backgroundColor = UIColor.init().secondaryColor()
            textfield.textColor = UIColor.white
        }
    }
    
    func presentResult (result: Int){
        switch result {
        case 0:
            sendAlertController(title: "Error", message: "Invalid input.")
            break
        case 1:
            sendAlertController(title: "BMI: \(bmi.roundTo(places: 2))", message: "Severely Underweight.")
            break
        case 2:
            sendAlertController(title: "BMI  \(bmi.roundTo(places: 2))", message: "Underweight.")
            break
        case 3:
            sendAlertController(title: "BMI: \(bmi.roundTo(places: 2))", message: "Acceptable.")
            break
        case 4:
            sendAlertController(title: "BMI: \(bmi.roundTo(places: 2))", message: "Overweight.")
            break
        case 5:
            sendAlertController(title: "BMI: \(bmi.roundTo(places: 2))", message: "Severely Overweight.")
            break
            
        default:
            sendAlertController(title: "Error", message: "Invalid input.")
            break
        }
    }
    
    func sendAlertController (title : String, message : String){
        let a = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction.init(title: "Dismiss", style: .cancel, handler: nil))
        self.present(a, animated: true, completion: nil)
    }
    
    
}
