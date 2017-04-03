//
//  CrisisContentModularVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 3/4/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit


var checkListItems :[String] = []
var content : [[String : Any]] = [[:]]


class CrisisContentModularVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var Headertitile: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! crisisContentCell
        cell.title.text = content[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
//MARK: -
    
    func styling(){
        self.view.backgroundColor = UIColor.init().primaryColor()
        _ = backButton.roundify_circle
    }

}

//MARK: - CHECK LIST

class checListTableView : UITableViewController{
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return checkListItems.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! checkListcell
        cell.title.text = checkListItems[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

class checkListcell : UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var checkButtn: UIButton!
    
}
