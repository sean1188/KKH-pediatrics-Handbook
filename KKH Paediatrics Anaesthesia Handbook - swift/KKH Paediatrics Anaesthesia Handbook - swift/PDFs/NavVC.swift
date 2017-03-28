//
//  NavVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 26/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class NavVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var marker: UIImageView!
    
    @IBOutlet var navBar_items: [UIView]!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var handbookViewController :UIViewController = HandbookVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabViews()
        navbar.backgroundColor = UIColor.init().secondaryColor()
        
    }
    
    func initTabViews(){
        var count = 1
        navBar_items.forEach { (view) in
            view.tag = count
            count = count + 1
        }
        //init tabviews
        handbookViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "handbookVC")
        self.addChildViewController(handbookViewController)
        self.bgView.addSubview(handbookViewController.view)
    }
    
    //MARK: - NAV BAR
    
    @IBAction func ref(_ sender: Any) {
        animateMarkerToIndex(index: 1)
    }
    
    @IBAction func calc(_ sender: Any) {
        animateMarkerToIndex(index: 2)
    }
    
    @IBAction func crisis(_ sender: Any) {
        animateMarkerToIndex(index: 3)
    }
    
    @IBAction func settings(_ sender: Any) {
        animateMarkerToIndex(index: 4)
    }
    
    func animateMarkerToIndex (index : Int){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            let view = self.navbar.viewWithTag(index)
            self.marker.center = (view?.center)!
        }, completion: nil)
    }
}
