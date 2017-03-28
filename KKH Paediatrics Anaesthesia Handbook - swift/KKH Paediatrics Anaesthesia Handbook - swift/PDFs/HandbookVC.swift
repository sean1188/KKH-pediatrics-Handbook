//
//  HandbookVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 27/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class HandbookVC: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var search_backdrop: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init().primaryColor()
        initHandbooks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //styling
        searchButton.titleLabel?.textColor = UIColor.init().secondaryColor()
        search_backdrop.layer.cornerRadius = search_backdrop.frame.size.width/2
    }
    
    func initHandbooks (){
        
    }

   

}
