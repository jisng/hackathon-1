//
//  DateCell.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/26.
//  Copyright © 2020 Jisng. All rights reserved.
//

import JTAppleCalendar
import UIKit

class DateCell: JTACDayCell {
    
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        baseUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseUI() {
        dateLabel.textAlignment = .center
        
        contentView.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
