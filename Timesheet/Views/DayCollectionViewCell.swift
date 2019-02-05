//
//  DayCollectionViewCell.swift
//  Timesheet
//
//  Created by Lateesh on 05/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var dailyTasksCollectionView: UICollectionView!
    var tasks : Int = 1
    @IBAction func addTasks(_ sender: Any) {
        if tasks < 7 {
            tasks = tasks + 1
        }
        self.dailyTasksCollectionView.reloadData()
        print("Tasks have been added.Total tasks - \(tasks)")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dailyTasksCollectionView.register(UINib.init(nibName: "DailyTaskCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DailyTaskCollectionViewCell")
        self.dailyTasksCollectionView.dataSource = self
        self.dailyTasksCollectionView.delegate = self
        self.dailyTasksCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyTaskCollectionViewCell", for: indexPath as IndexPath) as! DailyTaskCollectionViewCell
        return cell
    }
    
    
}
