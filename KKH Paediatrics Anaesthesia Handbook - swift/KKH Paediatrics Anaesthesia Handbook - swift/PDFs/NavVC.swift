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
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var handbookViewController :UIViewController = HandbookVC()
    var calcVC :UIViewController = CalcMainVC()

    
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
        handbookViewController.view.center = self.view.center
        self.scrollView.addSubview(handbookViewController.view)
        
        calcVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "calcVC")
        calcVC.view.frame = CGRect.init(x: self.handbookViewController.view.frame.origin.x + self.view.frame.size.width , y: handbookViewController.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.addChildViewController(calcVC)
        self.scrollView.addSubview(calcVC.view)
        
        scrollView.contentSize = CGSize.init(width: self.view.frame.size.width * 2, height: self.view.frame.size.height)
        
        moveScrollViewtoIndex(index: 0)
    }
    
    //MARK: - NAV BAR
    
    @IBAction func ref(_ sender: Any) {
        animateMarkerToIndex(index: 1)
        moveScrollViewtoIndex(index: 0)
        
    }
    
    @IBAction func calc(_ sender: Any) {
        animateMarkerToIndex(index: 2)
        moveScrollViewtoIndex(index: 1)
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
    
    func moveScrollViewtoIndex (index : Int){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.scrollView.setContentOffset(CGPoint.init(x: index * Int(self.view.frame.size.width), y: 0), animated: true)
        }, completion: nil)    }
}
