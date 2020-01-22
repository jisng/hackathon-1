//
//  InputViewController.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/22.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    private let inputview = InputView(frame: .zero)
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        addView()
    }
    
    private func addView() {
        view.addSubview(inputview)
        inputview.translatesAutoresizingMaskIntoConstraints = false
        
        let safe = view.safeAreaLayoutGuide
        
        inputview.widthAnchor.constraint(equalTo: safe.widthAnchor, multiplier: 0.8).isActive = true
        inputview.heightAnchor.constraint(equalTo: safe.heightAnchor, multiplier: 0.8).isActive = true
        inputview.centerXAnchor.constraint(equalTo: safe.centerXAnchor).isActive = true
        inputview.centerYAnchor.constraint(equalTo: safe.centerYAnchor).isActive = true
    }

}
