//
//  HandbookVC.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 27/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class HandbookVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var search_backdrop: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init().primaryColor()
        initHandbooks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //styling
        search_backdrop.layer.cornerRadius = search_backdrop.frame.size.width/2
    }
    
    func initHandbooks (){
        
    }
    
//MARK: - collectionvie delegate/datasource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HandbookCollectionViewCell
        cell.layer.cornerRadius = 10.0
        cell.backgroundColor = UIColor.init().secondaryColor()
        cell.indexLabel.textColor = UIColor.init().primaryColor()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
   

}
