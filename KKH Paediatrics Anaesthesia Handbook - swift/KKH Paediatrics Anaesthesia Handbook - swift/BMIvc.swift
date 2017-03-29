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
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       style()
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

}
