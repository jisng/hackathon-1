//
//  MonthViewController.swift
//  HousekeepingBook
//
//  Created by 박지승 on 2020/01/13.
//  Copyright © 2020 Jisng. All rights reserved.
//
import JTAppleCalendar
import UIKit

// tab-bar-tag-1: 월별, 캘린더 컨트롤러

class MonthViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
    }
    
    @objc func testAction(button: UIButton) {
        present(BudgetViewController(), animated: true)
    }
    
    


}
