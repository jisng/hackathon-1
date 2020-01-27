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
    let selectedView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        baseUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseUI() {
        dateLabel.textAlignment = .center
        selectedView.backgroundColor = AppColors.mainColor
        selectedView.isHidden = true
        
        contentView.addSubview(selectedView)
        contentView.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        selectedView.widthAnchor.constraint(equalTo: dateLabel.widthAnchor, multiplier: 1.5).isActive = true
        selectedView.heightAnchor.constraint(equalTo: dateLabel.heightAnchor, multiplier: 1.5).isActive = true
        selectedView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor).isActive = true
        selectedView.centerXAnchor.constraint(equalTo: dateLabel.centerXAnchor).isActive = true
    }
}
