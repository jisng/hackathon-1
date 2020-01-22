//
//  TestViewController.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/22.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tempView = TagView()
        tempView.backgroundColor = .black
        view.addSubview(tempView)
        tempView.translatesAutoresizingMaskIntoConstraints = false
//        tempView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tempView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tempView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        tempView.heightAnchor.constraint(equalToConstant: tempView.height).isActive = true
        tempView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tempView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    
    }
}
