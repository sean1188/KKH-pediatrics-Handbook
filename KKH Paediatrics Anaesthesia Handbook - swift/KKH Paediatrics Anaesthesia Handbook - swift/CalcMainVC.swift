//
//  CalcMainVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 29/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class CalcMainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init().primaryColor()
    }

    @IBAction func bmi(_ sender: Any) {
        let bmicontroller = UIStoryboard.init(name: "calculators", bundle: nil).instantiateViewController(withIdentifier: "bmi")
        self.present(bmicontroller, animated: true, completion: nil)
    }

    @IBAction func drug(_ sender: Any) {
    }

}
