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
import RATreeView
import SwiftyJSON

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
        selected_drug = nil
        isdown = false
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dropdownMenu(_ sender: Any) {
        ddMenu.show()
    }
    
    @IBAction func proceed(_ sender: Any) {
		//lazy programming lmao
		if selectionlabel.text == "Click to select..."{
			sendAlertController(title: "Error", message: "Please select Option", actionTitle: "Okay")
		}
		else{
        if selected_drug != 3{
        if weightField.text != ""{
            patientWeight = Int(weightField.text!)
            self.performSegue(withIdentifier: "send", sender: self)
        }
        else{            sendAlertController(title: "Error", message: "Invalid input, please check.", actionTitle: "Okay")
            }
        }
        else if selected_drug == 3 {
            if weightField.text != ""{
                patientWeight = Int(weightField.text!)
                self.performSegue(withIdentifier: "cd", sender: self)
            }
        }
        else{
            sendAlertController(title: "Error", message: "Invalid input, please check.", actionTitle: "Okay")
        }
		}
    }
    
    //MARK: - REUSE
    func styling () {
        self.view.backgroundColor = UIColor.init().primaryColor()
		backb.roundify_circle()
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
    
    func sendAlertController (title : String, message : String, actionTitle : String){
        let a = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction.init(title: actionTitle, style: .cancel, handler: nil))
        self.present(a, animated: true, completion: nil)
    }

    
    
}


////////////////////////////////////////////
                                        ////
                                        ////
//MARK: - DRUGS SENDING                 ////
////////////////////////////////////////////

class drugSendVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var backbutton: UIButton!
    
    var data: Data? = nil
    @IBOutlet weak var header: UILabel!
    
    
    let anaesthesia = DrugCalculationsManager.init(weight: patientWeight!)
    let cardiac     = CardiacDrugCalculationsManager.init(weight: patientWeight!)
    let scoliosis   = ScoliosisDrugCalculationsManager.init(weight: patientWeight!)
    var userIsviewingSheet = false
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        getData()
        userIsviewingSheet = false
    }
    
    func getData() {
        header.text = "CSV file for patient of weight \(patientWeight!) KG generated."
        switch selected_drug! {
        case 0:
           data =  cardiac.getData()
            break
        case 1:
            data = anaesthesia.getData()
            break
        case 2:
            data = scoliosis.getData()
            break
        default:
            break
        }
    }
    
    @IBAction func view(_ sender: Any) {
        openCSVwithData(data: data!)
    }
    
    
    @IBAction func back(_ sender: Any) {
        if userIsviewingSheet {
            closeCSVViewer()
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func share(_ sender: Any) {
        switch selected_drug! {
        case 0:
            cardiac.sendEmail(self)
            break
        case 1:
            anaesthesia.sendEmail(self)
            break
        case 2:
            scoliosis.sendEmail(self)
            break
        default:
            break
        }
    }
    
    //MARK: - REUSE
    func styling () {
        self.view.backgroundColor = UIColor.init().primaryColor()
		backbutton.roundify_circle()
        backbutton.backgroundColor = UIColor.init().secondaryColor()
        backbutton.titleLabel?.textColor = UIColor.white
    }
    
    var webView = UIWebView()
    func openCSVwithData (data:Data) {
        print (data)
        let file = "file.csv"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            //writing
            do {
                try data.write(to: path, options: .atomic)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                //setup webview
                webView = UIWebView.init(frame: CGRect.init(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height))
                webView.loadRequest(URLRequest.init(url: path))
                webView.isMultipleTouchEnabled = true
                webView.scrollView.isMultipleTouchEnabled = true
                webView.scrollView.maximumZoomScale = 2
                webView.scrollView.minimumZoomScale = 0.5
                webView.scrollView.setZoomScale(2, animated: true)
                webView.delegate = self
                webView.scalesPageToFit = true
                self.view.addSubview(webView)
                userIsviewingSheet = true
                self.view.bringSubview(toFront: backbutton)
            }
            catch {/* error handling here */}
        }
    }
    
    func closeCSVViewer (){
        userIsviewingSheet = false
        self.webView.removeFromSuperview()
        
    }
    
}


class commonDrugtables: UIViewController, RATreeViewDelegate, RATreeViewDataSource, UITextFieldDelegate {
    
    var dataTree : [dataobject]! = []
    
    var dispArray : [dataobject]! = []
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var topbar: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    override func viewDidLoad() {
        styling()
        processData()
        weightLabel.text = "Common drugs for patient weight: \(patientWeight!) KG"
    }
    
    func styling() {
        backButton.roundify_circle()
        backButton.titleLabel?.textColor = UIColor.init().secondaryColor()
        self.view.backgroundColor = UIColor.init().primaryColor()
    }
    
    func loadData(weight: Float) -> [String: [String: [String: Any]]]! {
        // This will load shit from the file.
        do {
            var returnValue: [String: [String: [String: [String: Any]]]] = [:]
            let content = try String(contentsOfFile: Bundle.main.path(forResource: "CommonDrugs", ofType: "json")!)
            let json = JSON(data: content.data(using: String.Encoding.utf8)!)
            
            for (key, jsonValue) in json {
                returnValue[key] = [:]
                for (key2, jsonValue2) in jsonValue {
                    if key2 == "name" { continue }
                    for (key3, jsonValue3) in jsonValue2 {
                        returnValue[key]![key3] = [:]
                        for (key4, jsonValue4) in jsonValue3 {
                            if key4 == "name" { continue }
                            for (key5, jsonValue5) in jsonValue4 {
                                returnValue[key]![key3]![key5] = [:]
                                for (key6, jsonValue6) in jsonValue5 {
                                    if key6 == "name" { continue }
                                    if let float = jsonValue6.float {
                                        returnValue[key]![key3]![key5]![key6] = float
                                    } else if let string = jsonValue6.string {
                                        returnValue[key]![key3]![key5]![key6] = string
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return returnValue
        } catch _ {}
        return nil
    }
    
    
    func processData (){
//        dump(loadData(weight: Float(patientWeight!)))
        let data = loadData(weight: Float(patientWeight!))
        data?.forEach({ (drug) in
            //new drug object
            print("\(drug.key)--- *")
            var newDrug : dataobject? = dataobject(name : drug.key)
            drug.value.forEach({ (path) in
                //new path object
                print(path.key)
                var newPath : dataobject? = dataobject(name: path.key)
                path.value.forEach({ (method) in
                    //new method object
                    var newMethod : dataobject? = dataobject(name: method.key)
                    print("methods:")
                    for (key, value) in method.value as! [String: String]{
                        if value != ""{
                            if key == "dose" {
                                let newvalue : dataobject = dataobject(name: "\(key):\n \(value) \((method.value as! [String: String])["unit"]!)")
                                newMethod?.addChild(newvalue)
                            }
                            else{
                            let newvalue : dataobject = dataobject(name: "\(key):\n \(value)")
                                newMethod?.addChild(newvalue)
                            }
                    }
                }
                    newPath?.addChild(newMethod!)
                    
                })
                newDrug?.addChild(newPath!)
            })
            dataTree.append(newDrug!)
        })
        
        dataTree.sort {$0.name < $1.name}
        dispArray = dataTree
        setupTreeView()
    
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//MARK: - Textfield as searchfield
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let resArray =  dataTree.filter{$0.name.lowercased().contains(textField.text!.lowercased())}
        print (resArray.map{$0.name})
        dispArray = resArray
        treeView.reloadData()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        dispArray = dataTree
        treeView.reloadData()
    }
    
//MARK: - RATreeview memes
    var treeView = RATreeView()
    func setupTreeView () {
        treeView = RATreeView(frame:CGRect.init(x: 0, y: 1.4 * self.topbar.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - self.topbar.frame.size.height))
        treeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        treeView.register(UINib(nibName: String(describing: CommonDrugsTablecell.self), bundle: nil), forCellReuseIdentifier: String(describing: CommonDrugsTablecell.self))
        treeView.dataSource = self
        treeView.delegate = self
        treeView.treeFooterView = UIView()
        treeView.separatorColor = .clear
        treeView.backgroundColor = .clear
        view.addSubview(treeView)
        view.sendSubview(toBack: treeView)
    }
    
    func treeView(_ treeView: RATreeView, heightForRowForItem item: Any) -> CGFloat {
        return 70
    }
    
    
    func treeView(_ treeView: RATreeView, didSelectRowForItem item: Any) {
        
    }
    
    
    func treeView(_ treeView: RATreeView, didCollapseRowForItem item: Any) {
    }
    
    
    func treeView(_ treeView: RATreeView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? dataobject{
            return item.children.count
        }
        else{
            return (dispArray?.count)!
        }
    }
    
    
    func treeView(_ treeView: RATreeView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? dataobject{
            return item.children[index]
        }
        else{
            return dispArray[index]
        }
    }
    
    
    func treeView(_ treeView: RATreeView, cellForItem item: Any?) -> UITableViewCell {
        let dataobejct = item as! dataobject
        let level = treeView.levelForCell(forItem: item)
        let cell = treeView.dequeueReusableCell(withIdentifier: String (describing : CommonDrugsTablecell.self )) as! CommonDrugsTablecell
        cell.label.text = dataobejct.name
        cell.label.textColor = UIColor.white
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.init().secondaryColor()
        //styling
        switch level {
        case 1:
            cell.leftMargin.constant = 15
        case 2:
            cell.leftMargin.constant = 30
        case 3:
            cell.leftMargin.constant = 45
        default:
            cell.leftMargin.constant = 0
            cell.backgroundColor = UIColor.init().primaryColor()

        }
        return cell
    }
    
}
