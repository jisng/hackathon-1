//
//  DateCell.swift
//  HousekeepingBook
//
//  Created by 박지승 on 2020/01/15.
//  Copyright © 2020 Jisng. All rights reserved.
//

import JTAppleCalendar
import UIKit

class DateCell: JTACDayCell {
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
