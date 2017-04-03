//
//  crisisNavVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 3/4/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

var weight : Float? = nil

class crisisNavVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var topbar: UIView!
    @IBOutlet weak var backb: UIButton!
    
    //crisis list
    @IBOutlet var filesView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    //reusing handbooktableviewcells
    @IBOutlet weak var tableView: UITableView!
    
    let arr = ["Basic Life Support (BLS)","Cardiac Arrest","LA Toxicity", "Hyperkalaemia","Malignant Hyperthermia", "Anaphylaxis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styling()
        backb.isEnabled = false
        backb.alpha = 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HandbookTableViewCell
        _ = cell.roundify_slight
        cell.backgroundColor = UIColor.init().secondaryColor()
        cell.index.textColor = UIColor.init().primaryColor()
        cell.index.text = String(indexPath.section + 1)
        cell.chapterName.text = arr[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "crisis_content")
        self.navigationController?.pushViewController(a, animated: true)
    }
    
    func styling(){
        titleLabel.textColor = UIColor.init().secondaryColor()
        topbar.backgroundColor = UIColor.init().primaryColor()
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = nextButton.roundify_circle
        nextButton.titleLabel?.textColor = UIColor.init().primaryColor()
        weightField.backgroundColor = UIColor.init().secondaryColor()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if !(weightField.text?.isEmpty)! {
            weight = Float(weightField.text!)
            titleLabel.text = "Patient Weight : \(weightField.text!)KG"
            filesView.frame = CGRect.init(x: 0, y: topbar.frame.size.height
                , width: self.view.frame.width, height: self.view.frame.height - 80 - topbar.frame.size.height)
            self.view.addSubview(filesView)
            backb.isEnabled = true
            backb.alpha = 1
            self.view.endEditing(true)
        }
        else{
            sendAlertController(title: "Error", message: "Please enter valid weight", actionTitle: "Okay")
        }
    }
    @IBAction func back(_ sender: Any) {
        filesView.removeFromSuperview()
        backb.isEnabled = false
        backb.alpha = 0
    }
    
    func sendAlertController (title : String, message : String, actionTitle : String){
        let a = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction.init(title: actionTitle, style: .cancel, handler: nil))
        self.present(a, animated: true, completion: nil)
    }

}
