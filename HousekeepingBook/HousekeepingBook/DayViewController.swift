//
//  ViewController.swift
//  HousekeepingBook
//
//  Created by 박지승 on 2020/01/13.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit
// tab-bar-tag-0: 일별, 오늘 지출 내역 추가 컨트롤러

class DayViewController: UIViewController {

    private let budgetLabel = UILabel()
    private let plusButton = UIButton()
    private lazy var tableView = UITableView(frame: .zero)
    
    var budget = "0" {
        willSet {
            self.budget = "\(newValue)"
        }
    }
    
    var sampleData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseUI()
        layout()
    }

    @objc func plusButtonAction(button: UIButton) {
        sampleData.append("dataTest")
        tableView.reloadData()
    }
    

    private func baseUI() {
        budgetLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        plusButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        budgetLabel.text = budget
        budgetLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        plusButton.addTarget(self, action: #selector(plusButtonAction(button:)), for: .touchUpInside)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.rowHeight = 70
        
        view.addSubview(budgetLabel)
        view.addSubview(plusButton)
        view.addSubview(tableView)
    }
    
    private func layout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        let uiArr = [budgetLabel, plusButton, tableView]
        for ui in uiArr {
            ui.translatesAutoresizingMaskIntoConstraints = false
            ui.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
            ui.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        }
//        budgetLabel.translatesAutoresizingMaskIntoConstraints = false
//        plusButton.translatesAutoresizingMaskIntoConstraints = false
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        budgetLabel.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        budgetLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.3).isActive = true
        
        plusButton.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor).isActive = true
        plusButton.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1).isActive = true
        
        tableView.topAnchor.constraint(equalTo: plusButton.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
    }

}

extension DayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sampleData[indexPath.row]
        return cell
    }
}
