//
//  crisisNavVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 3/4/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

public var weight : Float? = nil

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
         cell.roundify_slight()
        cell.backgroundColor = UIColor.init().secondaryColor()
        cell.index.textColor = UIColor.init().primaryColor()
        cell.index.text = String(indexPath.section + 1)
        cell.chapterName.text = arr[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            presentmodularContentVC(content: ContentManager.BasicLifeSupport)
            break
        case 1:
            let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "Ca")
            self.present(a, animated: true, completion: nil)
            break
		case 2 :
			let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "LA")
			self.present(a, animated: true, completion: nil)
			break
		case 3 :
			let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "hyperK")
			self.present(a, animated: true, completion: nil)
			break
        case 5:
            presentmodularContentVC(content: ContentManager.anaphylaxisContent(weight: 60) )
            break
        default:
            break
        }
    }
    
    func styling(){
        titleLabel.textColor = UIColor.init().secondaryColor()
        topbar.backgroundColor = UIColor.init().primaryColor()
        self.view.backgroundColor = UIColor.init().primaryColor()
         nextButton.roundify_circle()
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
    
    func presentmodularContentVC (content : [[String : Any]]){
        let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "crisis_content") as! CrisisContentModularVC
        a.content = content
        self.present(a, animated: true, completion: nil)
    }

}






class CardiacArrestMenu: UIViewController {
    
    @IBOutlet weak var backb: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nsButton: UIButton!
    @IBOutlet weak var sButtin: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    override func viewDidLoad() {
         backb.roundify_circle()
         contentView.roundify_slight()
        contentView.backgroundColor = UIColor.init().secondaryColor()
        contentView.layer.borderColor = UIColor.white.cgColor	
        contentView.layer.borderWidth = 1
         nsButton.roundify_slight()
         sButtin.roundify_slight()
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Nonshockable(_ sender: Any) {
        presentmodularContentVC(content: ContentManager.CardiacArrest_NONSHOCKcontent(weight!))
    }
    
    @IBAction func shockable(_ sender: Any) {
        presentmodularContentVC(content: ContentManager.CardiacArrest_SHOCKcontent(weight!))
    }
    
    
    func presentmodularContentVC (content : [[String : Any]]){
        let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "crisis_content") as! CrisisContentModularVC
        a.content = content
        self.present(a, animated: true, completion: nil)
    }
    
    
}

class LAMenu: UIViewController {
	
	@IBOutlet weak var backb: UIButton!
	@IBOutlet var buttoncollection: [UIButton]!
	@IBOutlet weak var containerView: UIView!
	
	
	
	override var preferredStatusBarStyle: UIStatusBarStyle{
		return .lightContent
	}
	
	override func viewDidLoad() {
		styling()
	}
	
	func styling(){
		self.view.backgroundColor = UIColor.init().primaryColor()
		 backb.roundify_circle()
		buttoncollection.forEach { (button) in
			 button.roundify_slight()
			button.titleLabel?.textColor = UIColor.init().secondaryColor()
		}
		containerView.backgroundColor = UIColor.init().secondaryColor()
		containerView.layer.borderWidth = 1
		containerView.layer.borderColor = UIColor.white.cgColor
		containerView.roundify_slight()
	}
	
	@IBAction func recog(_ sender: Any) {
		presentmodularContentVC(content: ContentManager.LA_Recognition(weight: weight!))
	}
	@IBAction func immediatem(_ sender: Any) {
		presentmodularContentVC(content: ContentManager.LA_Management(weight: weight!))
	}
	@IBAction func treatN(_ sender: Any) {
		presentmodularContentVC(content: ContentManager.LA_treatment_NeuroToxicity(weight: weight!))
	}
	
	@IBAction func treata(_ sender: Any) {
		presentmodularContentVC(content: ContentManager.LA_treatment_CardiotoxicityWithCA(weight: weight!))
	}
	
	@IBAction func treata2(_ sender: Any) {
		presentmodularContentVC(content: ContentManager.LA_treatment_CardiotoxicityWOCA(weight: weight!))
	}
	@IBAction func ITT(_ sender: Any) {
		presentmodularContentVC(content: ContentManager.LA_treatment_Intralipid(weight: weight!))
	}
	
	@IBAction func back(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	func presentmodularContentVC (content : [[String : Any]]){
		let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "crisis_content") as! CrisisContentModularVC
		a.content = content
		self.present(a, animated: true, completion: nil)
	}
	
}

class Hyperkmenu : UIViewController {
	
	@IBOutlet weak var backB: UIButton!
	@IBOutlet var buttonCollection: [UIButton]!
	@IBOutlet weak var contentView: UIView!
	
	override var preferredStatusBarStyle: UIStatusBarStyle{
		return .lightContent
	}
	
	override func viewDidLoad() {
		self.view.backgroundColor = UIColor.init().primaryColor()
		contentView.backgroundColor = UIColor.init().secondaryColor()
		contentView.roundify_slight()
		contentView.layer.borderColor = UIColor.white.cgColor
		contentView.layer.borderWidth = 1
		contentView.clipsToBounds = true
		backB.roundify_circle()
		buttonCollection.forEach { (button) in
			button.roundify_slight()
			button.titleLabel?.textColor = UIColor.init().secondaryColor()
			
		}
	}
	
	@IBAction func button1(_ sender: Any) {
		presentmodularContentVC(content: ContentManager.Hyperkalaemia_criteria(weight: weight!))
	}
	
	@IBAction func button2(_ sender: Any){
		presentmodularContentVC(content: ContentManager.Hyperkalaemia_ManagementAlgorithms(weight: weight!))
	}
	
	@IBAction func button3(_ sender: Any){
		presentmodularContentVC(content: ContentManager.Hyperkalaemia_Treatment(weight: weight!))
	}
	
	@IBAction func button4(_ sender: Any){
		presentmodularContentVC(content: ContentManager.Hyperkalaemia_SerumDosage(weight: weight!))
	}
	
	@IBAction func back(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	func presentmodularContentVC (content : [[String : Any]]){
		let a = UIStoryboard.init(name: "crisis", bundle: nil).instantiateViewController(withIdentifier: "crisis_content") as! CrisisContentModularVC
		a.content = content
		self.present(a, animated: true, completion: nil)
	}
	
}



































