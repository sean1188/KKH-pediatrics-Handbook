//
//  HandbookCollectionViewCell.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 28/3/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class HandbookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.contentView.autoresizingMask = .flexibleWidth
		self.contentView.translatesAutoresizingMaskIntoConstraints = true;
	}
}
