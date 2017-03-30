//
//  drugVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 30/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class drugVC: UIViewController {

    
    @IBOutlet weak var backb: UIButton!
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//MARK: - REUSE
    func styling () {
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = backb.roundify_circle
    }


}
