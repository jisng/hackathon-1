//
//  MonthViewController.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController {
    
    private let monthView = MonthView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
    }
    
    private func addView() {
        view.addSubview(monthView)
        monthView.translatesAutoresizingMaskIntoConstraints = false
        monthView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        monthView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        monthView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        monthView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive =  true
    }
}
