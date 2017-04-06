//
//  NavVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 26/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class NavVC: UIViewController {
    
//    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var marker: UIImageView!
    
    @IBOutlet var navBar_items: [UIView]!
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    var currentIndex = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var handbookViewController :UIViewController = HandbookVC()
    var calcVC :UIViewController = CalcMainVC()
    var crisisVC : UIViewController = crisisNavVC()
	var settingVC : UIViewController = settingsVC()
    
    var load = true

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.backgroundColor = UIColor.init().primaryColor()
        navbar.backgroundColor = UIColor.init().secondaryColor()
        load = false
    }
    
    //use fiew appear workaround to overcome autolayout error
    override func viewDidAppear(_ animated: Bool) {
        if !load {
            initTabViews()
            load = true
        }
    }
	
    
    func initTabViews(){
        var count = 1
        navBar_items.forEach { (view) in
            view.tag = count
            count = count + 1
        }
        //init tabviews
        scrollView.contentSize = CGSize.init(width: self.view.frame.size.width * 3, height: self.view.frame.size.height)
        scrollView.isScrollEnabled = true
        
        //calculator
        calcVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "calcVC")
        self.addChildViewController(calcVC)
        calcVC.view.center = CGPoint.init(x: self.view.frame.size.width * 1.5, y: self.view.frame.height/2)
        self.scrollView.addSubview(calcVC.view)
        
        //handbooks
        handbookViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "handbookVC")
        self.addChildViewController(handbookViewController)
        handbookViewController.view.center = self.view.center
        self.scrollView.addSubview(handbookViewController.view)
        
        //crisis
        crisisVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "crisis")
        self.addChildViewController(crisisVC)
        crisisVC.view.center = CGPoint.init(x: self.view.frame.size.width * 2.5, y: self.view.frame.height/2)
        self.scrollView.addSubview(crisisVC.view)
		
		//crisis
		settingVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "settings")
		self.addChildViewController(settingVC)
		settingVC.view.center = CGPoint.init(x: self.view.frame.size.width * 3.5, y: self.view.frame.height/2)
		self.scrollView.addSubview(settingVC.view)
		
		
        moveScrollViewtoIndex(index: 0)
        scrollView.isScrollEnabled = false
    }
    
    @IBAction func swipedLeft(_ sender: Any) {
        if currentIndex < 3{
            moveScrollViewtoIndex(index: currentIndex + 1)
        }
    }
    
    @IBAction func swipedRight(_ sender: Any) {
        if currentIndex > 0{
            moveScrollViewtoIndex(index: currentIndex - 1)

        }
    }
    
    //MARK: - NAV BAR
    
    @IBAction func ref(_ sender: Any) {
        moveScrollViewtoIndex(index: 0)
        
    }
    
    @IBAction func calc(_ sender: Any) {
        moveScrollViewtoIndex(index: 1)
}
    
    @IBAction func crisis(_ sender: Any) {
        moveScrollViewtoIndex(index: 2)

    }
    
    @IBAction func settings(_ sender: Any) {
        moveScrollViewtoIndex(index: 3)

    }
    
    func animateMarkerToIndex (index : Int){
        currentIndex = index
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            let view = self.navbar.viewWithTag(index)
            self.marker.center = (view?.center)!
        }, completion: nil)
    }
    
    func moveScrollViewtoIndex (index : Int){
            self.scrollView.setContentOffset(CGPoint.init(x: index * Int(self.view.frame.size.width), y: 0), animated: true)
        animateMarkerToIndex(index: index + 1)
        currentIndex = index
}
}






class settingsVC : UIViewController {
	
	@IBOutlet weak var topview: UIView!
	@IBOutlet var containers: [UIView]!
	
	var startupIndex: Int! = Int()
	override func viewDidLoad() {
		super.viewDidLoad()
		startupIndex = UserDefaults.standard.integer(forKey: "startup")
		styling()
	}
	
	func styling () {
		self.view.backgroundColor = UIColor.init().primaryColor()
		topview.backgroundColor = UIColor.init().primaryColor()
		containers.forEach { (container) in
			container.roundify_slight()
			container.layer.borderColor = UIColor.white.cgColor
			container.layer.borderWidth = 1
			container.backgroundColor = UIColor.init().secondaryColor()
		}
	}
	
	@IBAction func aboutus(_ sender: Any) {
		let a = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abtus")
		self.present(a, animated: true, completion: nil)
	}
	
}

class aboutUSVC : UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func back(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func moreAbout(_ sender: Any) {
		UIApplication.shared.openURL(URL.init(string: "https://sstinc.org/")!)
	}
	
}

















