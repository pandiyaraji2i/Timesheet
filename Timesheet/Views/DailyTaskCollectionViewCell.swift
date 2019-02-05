//
//  DailyTaskCollectionViewCell.swift
//  Timesheet
//
//  Created by Lateesh on 05/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import UIKit

class DailyTaskCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
    }
    
}

