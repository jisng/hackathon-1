//
//  TagView.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/22.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

struct Padding {
    static let xPadding: CGFloat = 8
    static let yPadding: CGFloat = 8
    static let size: CGFloat = 72
}

class TagView: UIView {
    
    private let scrollView = UIScrollView()
    
//    var height: CGFloat {
//        get { (Padding.size * 2) + (Padding.yPadding * 3) }
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        baseUI()
        makeTagButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseUI() {
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    @objc private func didTapTagButton(_ button: UIButton) {
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = .zero
        button.layer.shadowColor = AppColors.mainColor.cgColor
    }
    
    private func makeTagButton() {
        var buttonArray = [UIButton]()
        for item in Tags.list {
            print(item.name)
            let button = UIButton()
            button.setTitle(item.name, for: .normal)
            button.backgroundColor = item.color
            button.layer.cornerRadius = Padding.size/2
            button.addTarget(self, action: #selector(didTapTagButton(_:)), for: .touchUpInside)
            
            buttonArray.append(button)
            
            scrollView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: Padding.size).isActive = true
            button.heightAnchor.constraint(equalToConstant: Padding.size).isActive = true
        }
        
        var topButtons = [UIButton]()
        var bottomButtons = [UIButton]()
        for (index, button) in buttonArray.enumerated() {
            switch (index % 2 == 0) {
            case true:
                button.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Padding.yPadding).isActive = true
                topButtons.append(button)
                
            case false:
                button.topAnchor.constraint(equalTo: buttonArray[index - 1].bottomAnchor, constant: Padding.yPadding).isActive = true
                button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -Padding.yPadding).isActive = true
                bottomButtons.append(button)
            }
        }
        buttonHorizentalConstranint(buttons: topButtons, status: true)
        buttonHorizentalConstranint(buttons: bottomButtons, status: false)
    }
    
    private func buttonHorizentalConstranint(buttons: [UIButton], status: Bool) {
        for (index, button) in buttons.enumerated() {
            switch index {
            case 0:
                button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Padding.xPadding).isActive = true
            case buttons.count - 1:
                if status {
                    button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Padding.xPadding).isActive = true
                }
                fallthrough
            default:
                button.leadingAnchor.constraint(equalTo: buttons[index - 1].trailingAnchor, constant: Padding.xPadding).isActive = true
            }
        }
    }
    
}
