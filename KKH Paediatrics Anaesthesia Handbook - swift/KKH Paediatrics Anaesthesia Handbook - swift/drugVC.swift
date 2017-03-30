//
//  drugVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 30/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit
import DropDown

class drugVC: UIViewController {

    
    @IBOutlet weak var backb: UIButton!
    @IBOutlet weak var ddplaceholder: UIView!
    @IBOutlet weak var weightField: UITextField!
    
    let ddMenu = DropDown()
    var isdown = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        isdown = false
        
    }

    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dropdownMenu(_ sender: Any) {
        ddMenu.show()
    }
    
//MARK: - REUSE
    func styling () {
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = backb.roundify_circle
        ddplaceholder.backgroundColor = UIColor.init().secondaryColor()
        weightField.backgroundColor = UIColor.init().secondaryColor()

        //setup dd menu
        ddMenu.anchorView = ddplaceholder
        ddMenu.dataSource = ["Cardiac","Anaesthesia","Scoliosis","Common"]
        ddMenu.backgroundColor = UIColor.init().secondaryColor()
        ddMenu.selectionBackgroundColor = UIColor.init().primaryColor()
        ddMenu.textColor = UIColor.white
        ddMenu.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
        }
    }


}
