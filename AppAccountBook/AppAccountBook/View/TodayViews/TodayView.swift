//
//  TodayView.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class TodayView: UIView {

    private let budgetLabel = UILabel()
    private let tableView = UITableView(frame: .zero)
    let plusButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseUI()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseUI() {
        budgetLabel.backgroundColor = AppColors.mainColor
//        budgetLabel.text = "\(budget)"
        budgetLabel.textAlignment = .center
        budgetLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        
        
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70
        
        plusButton.backgroundColor = AppColors.mainColor
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        plusButton.layer.cornerRadius = 35
        plusButton.layer.shadowOpacity = 0.5
        plusButton.layer.shadowColor = UIColor.gray.cgColor
        plusButton.layer.shadowRadius = 4
        plusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        super.addSubview(budgetLabel)
        super.addSubview(tableView)
        super.addSubview(plusButton)
    }
    private func autoLayout() {
        let safeArea = super.safeAreaLayoutGuide
        let uiArr = [budgetLabel, plusButton, tableView]
        for ui in uiArr {
            ui.translatesAutoresizingMaskIntoConstraints = false
            if ui != plusButton {
                ui.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
                ui.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
            }
        }
        budgetLabel.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        budgetLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.4).isActive = true
        
        tableView.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10).isActive = true
    
        plusButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        plusButton.heightAnchor.constraint(equalTo: plusButton.widthAnchor).isActive = true
    }
}

extension TodayView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}

extension TodayView: UITableViewDelegate {
    
}
