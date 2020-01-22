//
//  EntryView.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/22.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class InputView: UIView {

    private let inputTextField = UITextField()
    private let tagView = TagView()
    private let memoTextField = UITextField()
    private let okButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseUI()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseUI() {
        inputTextField.backgroundColor = AppColors.mainColor
        inputTextField.tintColor = .white
        inputTextField.font = .systemFont(ofSize: 32, weight: .medium)
        inputTextField.textAlignment = .center
        inputTextField.placeholder = "사용 금액"
        inputTextField.delegate = self
        
        memoTextField.backgroundColor = .lightGray
        memoTextField.tintColor = .black
        memoTextField.font = .systemFont(ofSize: 16, weight: .thin)
        memoTextField.textAlignment = .left
        memoTextField.placeholder = "10자 내로 입력하세요."
        memoTextField.delegate = self
        
        okButton.setTitle("입력", for: .normal)
        okButton.backgroundColor = AppColors.mainColor
//        okButton.layer.cornerRadius = 10
        
        self.addSubview(inputTextField)
        self.addSubview(tagView)
        self.addSubview(memoTextField)
        self.addSubview(okButton)
    }
    
    private func autoLayout() {
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        tagView.translatesAutoresizingMaskIntoConstraints = false
        memoTextField.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        inputTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        inputTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        inputTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        tagView.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 24).isActive = true
        tagView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tagView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tagView.bottomAnchor.constraint(equalTo: memoTextField.topAnchor, constant: -24).isActive = true
        
        memoTextField.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        memoTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        memoTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        
        okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        okButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
    }

}

extension InputView: UITextFieldDelegate {
    
}
