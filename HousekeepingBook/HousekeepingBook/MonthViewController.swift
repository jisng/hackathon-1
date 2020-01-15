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
    
    private let calender = JTACMonthView()
    private let budgetButton = UIButton(type: .system)
    private var budget = 0 {
        didSet {
            budgetButton.setTitle("\(budget)", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        calender.backgroundColor = .systemBackground
        calender.calendarDataSource = self
        calender.calendarDelegate = self
        calender.register(DateCell.self, forCellWithReuseIdentifier: "DateCell")
        budgetButton.addTarget(self, action: #selector(didTapBudgetButton), for: .touchUpInside)
        setupUI()
    }
    
    @objc private func didTapBudgetButton() {
        // 예산 버튼 클릭
        print("didTapBudgetButton()")
        
        present(BudgetViewController(), animated: true)
    }
    
    private func setupUI() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(calender)
        view.addSubview(budgetButton)
        
        budgetButton.translatesAutoresizingMaskIntoConstraints = false
        calender.translatesAutoresizingMaskIntoConstraints = false
        
        
        budgetButton.setTitle("0", for: .normal)
        budgetButton.titleLabel?.font = .systemFont(ofSize: 40, weight: .heavy)
        budgetButton.tintColor = .black
        budgetButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        
        budgetButton.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        budgetButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        budgetButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        budgetButton.heightAnchor.constraint(equalToConstant: view.bounds.height / 4).isActive = true
        
        calender.topAnchor.constraint(equalTo: budgetButton.bottomAnchor).isActive = true
        calender.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        calender.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        calender.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
    }
    
    
    


}

extension MonthViewController: JTACMonthViewDataSource{
    
    
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 01 01")!
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate,
                                       endDate: endDate)
    }
    
    
}

extension MonthViewController: JTACMonthViewDelegate {
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "DateCell", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return cell
    }
    
   
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! DateCell
        configurationCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        guard let cell = cell else { return }
        configurationCell(view: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        guard let cell = cell else { return }
        configurationCell(view: cell, cellState: cellState)
    }
    
    
    private func configurationCell(view: JTACDayCell, cellState: CellState) {
           guard let cell = view as? DateCell else { return }
           cell.dateLabel.text = cellState.text
        
           handleCell(cell: cell, cellState: cellState)
           handleCellSelected(cell: cell, cellState: cellState)
       }

       private func handleCell(cell: DateCell, cellState: CellState) {
        
           if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
           }else {
               cell.isHidden = true
           }
            
        if cellState.day == .sunday {
            cell.dateLabel.textColor = .red
        }else if cellState.day == .saturday {
            cell.dateLabel.textColor = .blue
        }else {
            cell.dateLabel.textColor = .black
        }
        
        let currentTime = setCurrentTimeZone(state: Date())
        let cellTime = setCurrentTimeZone(state: cellState.date)
        print("current: \(currentTime) | cellTime \(cellTime)")
        if currentTime == cellTime {
            cell.selectedView.isHidden = false
        }else {
            cell.selectedView.isHidden = true
        }
        
        
        
       }
    private func handleCellSelected(cell: DateCell, cellState: CellState) {
        if cellState.isSelected {
            
        }else {
            
        }
    }
    
    private func setCurrentTimeZone(state: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.string(from: state)
        return date
    }
    
}

//
//extension MonthViewController: JTACYearViewDataSource {
//    func configureCalendar(_ calendar: JTACYearView) -> (configurationParameters: ConfigurationParameters, months: [Any]) {
//        <#code#>
//    }
//    
//    
//    
//    
//}
//
//extension MonthViewController: JTACYearViewDelegate {
//    
//    func calendar(_ calendar: JTACYearView, sizeFor item: Any) -> CGSize {
//        <#code#>
//    }
//    
//    func calendar(_ calendar: JTACYearView, monthView: JTACCellMonthView, drawingFor segmentRect: CGRect, with date: Date, dateOwner: DateOwner, monthIndex index: Int) {
//        <#code#>
//    }
//    
//    func calendar(_ calendar: JTACYearView, cellFor item: Any, at date: Date, indexPath: IndexPath) -> JTACMonthCell {
//        <#code#>
//    }
//    
//    
//}
