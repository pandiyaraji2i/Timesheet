//
//  TimeSheetViewController.swift
//  Timesheet
//
//  Created by Lateesh on 05/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import UIKit

class TimeSheetViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var timesheetItems = [["MONDAY","December 10"],["TUESDAY","December 11"],["WEDNESDAY","December 12"],["THURSDAY","December 13"],["FRIDAY","December 14"],["SATURDAY","December 15"],["SUNDAY","December 16"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Timesheet"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCollectionViewCell", for: indexPath as IndexPath) as! DayCollectionViewCell
        cell.dayLabel.text = timesheetItems[indexPath.row][0]
        cell.dateLabel.text = timesheetItems[indexPath.row][1]
        return cell
    }

    @IBAction func leftArrowClicked(_ sender: Any) {
        print("Left arrow clicked!")
    }
    
    @IBAction func rightArrowClicked(_ sender: Any) {
        print("Right arrow clicked!")
    }
    
}
