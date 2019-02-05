//
//  TimeSheetViewController.swift
//  Timesheet
//
//  Created by Lateesh on 05/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import UIKit

class TimeSheetViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var timesheetItems = [DayModel]()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dayCollectionView: UICollectionView!
    var subtractWeekFactor = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Timesheet"
        self.updateCollectionViewList()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timesheetItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCollectionViewCell", for: indexPath as IndexPath) as! DayCollectionViewCell
        cell.dayLabel.text = timesheetItems[indexPath.row].day
        cell.dateLabel.text = timesheetItems[indexPath.row].month.prefix(3) + " " + timesheetItems[indexPath.row].date

        return cell
    }
    
    func updateCollectionViewList() {
        let monday = getMondayOfCurrentWeek(currentDate: Calendar.current.date(byAdding: .day, value: (subtractWeekFactor*7), to: Date())!)
        self.timesheetItems.removeAll()
        for index in 0...6 {
            let iteratingDay = Calendar.current.date(byAdding: .day, value: index, to: monday)!
            self.timesheetItems.append(DayModel(day :iteratingDay.day ,month:iteratingDay.month ,date: iteratingDay.date,year: iteratingDay.year))
        }
        let labelText = "\(timesheetItems[0].date!)th - \(timesheetItems[6].date!)th \(timesheetItems[6].month!.prefix(3)) \(timesheetItems[0].year)"
        self.label.text = labelText
        self.dayCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 10, height: 164)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    @IBAction func leftArrowClicked(_ sender: Any) {
        print("Left arrow clicked!")
        subtractWeekFactor = subtractWeekFactor - 1
        updateCollectionViewList()
    }
    
    @IBAction func rightArrowClicked(_ sender: Any) {
        print("Right arrow clicked!")
        if subtractWeekFactor < 0 {
            subtractWeekFactor = subtractWeekFactor + 1
        }
        updateCollectionViewList()
    }
    
}
