//
//  ChartViewController.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    private let chartView = ChartView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
    }

    private func addView() {
        view.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        chartView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
