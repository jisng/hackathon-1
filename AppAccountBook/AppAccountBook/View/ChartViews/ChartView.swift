//
//  ChartView.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class ChartView: UIView {
    
    private let infoText = UILabel()
    private let presentCostView = UIView()
    private let presentCostText = UILabel()
    private let guideLine = UILabel()
    private let segmented = UISegmentedControl(items: ["Tag", "Day"])
    private let chartTableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseUI()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapSegment(_ segment: UISegmentedControl) {
        
    }
    
    private func baseUI() {
        infoText.text = "현재까지 사용 금액입니다."
        infoText.tintColor = .gray
        infoText.font = .systemFont(ofSize: 15, weight: .light)
        
//        presentCostText.text = "100000"
        presentCostText.tintColor = .black
        presentCostText.font = .systemFont(ofSize: 40, weight: .heavy)
        presentCostText.textAlignment = .center
        //        presentCostText.alpha = 0.0
        
        guideLine.backgroundColor = AppColors.mainColor
        
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(didTapSegment(_:)), for: .valueChanged)
        
        chartTableView.dataSource = self
        chartTableView.delegate = self
        chartTableView.rowHeight = 80
        chartTableView.register(UITableViewCell.self, forCellReuseIdentifier: "test")
//        tagListView.register(StatsCell.self, forCellReuseIdentifier: "Cell")
        chartTableView.separatorStyle = .none
        
        super.addSubview(presentCostView)
        presentCostView.addSubview(presentCostText)
        presentCostView.addSubview(infoText)
        super.addSubview(guideLine)
        super.addSubview(segmented)
        super.addSubview(chartTableView)
    }
    
    private func autoLayout() {
        segmented.translatesAutoresizingMaskIntoConstraints = false
        infoText.translatesAutoresizingMaskIntoConstraints = false
        presentCostView.translatesAutoresizingMaskIntoConstraints = false
        presentCostText.translatesAutoresizingMaskIntoConstraints = false
        guideLine.translatesAutoresizingMaskIntoConstraints = false
        chartTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeLayout = super.safeAreaLayoutGuide
        
        presentCostView.topAnchor.constraint(equalTo: safeLayout.topAnchor).isActive = true
        presentCostView.heightAnchor.constraint(equalTo: safeLayout.heightAnchor, multiplier: 0.2).isActive = true
        presentCostView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor).isActive = true
        presentCostView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor).isActive = true
        
        infoText.topAnchor.constraint(equalTo: presentCostView.topAnchor, constant: 30).isActive = true
        infoText.centerXAnchor.constraint(equalTo: presentCostView.centerXAnchor).isActive = true
        
        guideLine.topAnchor.constraint(equalTo: presentCostView.bottomAnchor).isActive = true
        guideLine.widthAnchor.constraint(equalTo: safeLayout.widthAnchor, multiplier: 0.8).isActive = true
        guideLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        guideLine.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor).isActive = true
        
        presentCostText.centerXAnchor.constraint(equalTo: presentCostView.centerXAnchor).isActive = true
        presentCostText.bottomAnchor.constraint(equalTo: guideLine.bottomAnchor, constant: -20).isActive = true
 
        segmented.topAnchor.constraint(equalTo: guideLine.bottomAnchor, constant: 16).isActive = true
        segmented.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor).isActive = true
        segmented.widthAnchor.constraint(equalTo: safeLayout.widthAnchor, multiplier: 0.5).isActive = true
        
        chartTableView.topAnchor.constraint(equalTo: segmented.bottomAnchor, constant: 16).isActive = true
        chartTableView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor).isActive = true
        chartTableView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor).isActive = true
        chartTableView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor).isActive = true
    }
}

extension ChartView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    
}

extension ChartView: UITableViewDelegate {
    
}
