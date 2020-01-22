//
//  ViewController.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    private let todayView = TodayView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        buttonAction()
    }
    
    @objc private func didTapOkButton(_ button: UIButton) {
        present(InputViewController(), animated: true)
    }
    
    private func buttonAction() {
        todayView.plusButton.addTarget(self, action: #selector(didTapOkButton), for: .touchUpInside)
    }
    
    private func addView() {
        view.addSubview(todayView)
        todayView.translatesAutoresizingMaskIntoConstraints = false
        todayView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        todayView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        todayView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        todayView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

