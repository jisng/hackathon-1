//
//  MonthViewController.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//
import JTAppleCalendar
import UIKit

class MonthViewController: UIViewController {
    
    private let monthView = MonthView(frame: .zero)
    private let calenderView = JTACMonthView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        addCalender()
    }
    
    private func addCalender() {
        calenderView.backgroundColor = .white
        calenderView.register(DateCell.self, forCellWithReuseIdentifier: "date")
        calenderView.calendarDelegate = self
        calenderView.calendarDataSource = self
        
        view.addSubview(calenderView)
        
        calenderView.translatesAutoresizingMaskIntoConstraints = false
        calenderView.topAnchor.constraint(equalTo: monthView.scrollView.topAnchor).isActive = true
        calenderView.leadingAnchor.constraint(equalTo: monthView.scrollView.leadingAnchor).isActive = true
        calenderView.trailingAnchor.constraint(equalTo: monthView.scrollView.trailingAnchor).isActive = true
        calenderView.bottomAnchor.constraint(equalTo: monthView.scrollView.bottomAnchor).isActive = true
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

extension MonthViewController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 01 01")!
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate, endDate: endDate, hasStrictBoundaries: true)
    }
}

extension MonthViewController: JTACMonthViewDelegate {
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "date", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return cell
    }
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    private func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? DateCell  else { return }
        cell.dateLabel.text = cellState.text
        handleCellTextColor(cell: cell, cellState: cellState)
    }

    private func handleCellTextColor(cell: DateCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
        } else {
            cell.isHidden = true
        }
    }
}
