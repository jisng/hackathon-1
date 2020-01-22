//
//  MonthView.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class MonthView: UIView {
    
    private let scrollView = UIScrollView()
    private let budgetView = UIView()
    private let budgetButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseUI()
        self.autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseUI() {
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .red
        
        budgetView.backgroundColor = AppColors.mainColor
        
        budgetButton.titleLabel?.font = .systemFont(ofSize: 40, weight: .heavy)
        budgetButton.tintColor = AppColors.mainColor
        budgetButton.backgroundColor = .white
        
        super.addSubview(scrollView)
        super.addSubview(budgetView)
        budgetView.addSubview(budgetButton)
    }
    
    private func autoLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        budgetView.translatesAutoresizingMaskIntoConstraints = false
        budgetButton.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = super.safeAreaLayoutGuide
        
        scrollView.topAnchor.constraint(equalTo: budgetButton.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
        budgetView.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        budgetView.leadingAnchor.constraint(equalTo: super.leadingAnchor).isActive = true
        budgetView.trailingAnchor.constraint(equalTo: super.trailingAnchor).isActive = true
        budgetView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.4).isActive = true
        
        budgetButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        budgetButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        budgetButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        budgetButton.bottomAnchor.constraint(equalTo: budgetView.bottomAnchor, constant: -10).isActive = true
    }
}
