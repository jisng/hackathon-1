//
//  MonthViewController.swift
//  HousekeepingBook
//
//  Created by 박지승 on 2020/01/13.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit
// tab-bar-tag-1: 월별, 캘린더 컨트롤러

class MonthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let testButton = UIButton(type: .system)
        testButton.frame = CGRect(x: view.center.x, y: view.center.y, width: 100, height: 100)
        testButton.center = CGPoint(x: view.center.x, y: view.center.y)
        testButton.setTitle("예산", for: .normal)
        testButton.backgroundColor = .black
        testButton.addTarget(self, action: #selector(testAction(button:)), for: .touchUpInside)
        view.addSubview(testButton)
    }
    
    @objc func testAction(button: UIButton) {
        present(BudgetViewController(), animated: true)
    }


}
