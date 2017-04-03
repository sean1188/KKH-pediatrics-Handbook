//
//  CrisisContentModularVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 3/4/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit




class CrisisContentModularVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var Headertitile: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var content : [[String : Any]] = [[:]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styling()
    }
    
    
//MARK: - tableview delegate/ datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = (content[indexPath.section][content[indexPath.section].keys.first!] as! [String : Any])["type"] as! String
        print (type)
        if type == "text" {
            return 250
        }
        else if type == "header" {
            return 100
        }
        else if type == "checkList_anap1"{
            return 600
        }
        else if type == "checkList_anap2"{
            return 400
        }
        else{
            return 176
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = (content[indexPath.section][content[indexPath.section].keys.first!] as! [String : Any])["type"] as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: type) as! crisisContentCell
        cell.title?.text = content[indexPath.section].keys.first
        cell.content?.text = (content[indexPath.section][content[indexPath.section].keys.first!] as! [String : Any])["content"] as! String
        cell.title.textColor = UIColor.init().secondaryColor()
        if type == "header" {
            cell.backgroundColor = .clear
        }
        else{
            cell.backgroundColor = UIColor.init().secondaryColor()}
        _ =  cell.roundify_slight
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
//MARK: -
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func styling(){
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = backButton.roundify_circle
    }

}

