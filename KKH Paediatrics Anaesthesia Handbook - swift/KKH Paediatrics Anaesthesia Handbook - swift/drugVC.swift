//
//  drugVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 30/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit
import DropDown
import PDFReader

var selected_drug: Int? = nil
var patientWeight: Int? = nil

class drugVC: UIViewController {

    
    @IBOutlet weak var backb: UIButton!
    @IBOutlet weak var ddplaceholder: UIView!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var selectionlabel: UILabel!
    
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

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dropdownMenu(_ sender: Any) {
        ddMenu.show()
    }
    
    @IBAction func proceed(_ sender: Any) {
        if weightField.text != nil{
        patientWeight = Int(weightField.text!)
        self.performSegue(withIdentifier: "send", sender: self)
        }
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
            self.selectionlabel.text = item
            selected_drug = index
        }
    }


}


//MARK: -
//MARK: - DRUGS SENDING


class drugSendVC: UIViewController {
    
    @IBOutlet weak var backbutton: UIButton!
    
    
    let anaesthesia = DrugCalculationsManager.init(weight: patientWeight!)
    let cardiac     = CardiacDrugCalculationsManager.init(weight: patientWeight!)
    let scoliosis   = ScoliosisDrugCalculationsManager.init(weight: patientWeight!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        openCSVwithData(data: anaesthesia.getData()!)
    }
    
    //MARK: - REUSE
    func styling () {
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = backbutton.roundify_circle
    }
    
    func openCSVwithData (data:Data) {
        print (data)
        let file = "file.csv" //this is the file. we will write to and read from it
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            //writing
            do {
                try data.write(to: path, options: .atomic)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                var webView = UIWebView.init(frame: CGRect.init(x: 0, y: self.backbutton.frame.size.height + self.backbutton.frame.origin.y + 30, width: self.view.frame.size.width, height: self.view.frame.size.height - (self.backbutton.frame.size.height + self.backbutton.frame.origin.y + 30)))
                webView.loadRequest(URLRequest.init(url: path))
                self.view.addSubview(webView)
            }
            catch {/* error handling here */}
        }
        
        
    }
    
    
}
