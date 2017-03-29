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
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = backB.roundify_circle
        backB.tintColor = UIColor.init().secondaryColor()
        genderSegment.tintColor = UIColor.init().secondaryColor()
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
