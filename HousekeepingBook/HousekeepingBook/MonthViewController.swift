//
//  MonthViewController.swift
//  HousekeepingBook
//
//  Created by 박지승 on 2020/01/13.
//  Copyright © 2020 Jisng. All rights reserved.
//
import JTAppleCalendar
import UIKit

// tab-bar-tag-1: 월별, 캘린더 컨트롤러

class MonthViewController: UIViewController {
        
//    private let layout = UICollectionViewFlowLayout()
//    private let calendarView = UICollectionView(frame: .zero)
    
    lazy var calendarView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 85, height: 84)
        layout.minimumInteritemSpacing = CGFloat(0)
        layout.minimumLineSpacing = CGFloat(0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .lightGray
        return cv
    }()
    
    let dateCell = DateCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        baseCalendar()
        baseCell()
    }
    
    @objc func testAction(button: UIButton) {
        present(BudgetViewController(), animated: true)
    }
    
    private func baseCalendar () {
        
        
        view.addSubview(calendarView)
        calendarView.addSubview(dateCell)
        
        calendarView.register(DateCell.self, forCellWithReuseIdentifier: "dateCell")
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        calendarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func baseCell() {
        calendarView.register(DateCell.self, forCellWithReuseIdentifier: "dateCell")
    }
}

extension MonthViewController: JTACMonthViewDataSource{
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 01 01")!
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate, endDate: endDate)
    }
}

extension MonthViewController: JTACMonthViewDelegate{
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as!
        DateCell
        cell.dateLabel.text = cellState.text
        return cell
    }
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! DateCell
        cell.dateLabel.text = cellState.text
    }
}
