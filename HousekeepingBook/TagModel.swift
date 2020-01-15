//
//  TagModel.swift
//  HousekeepingBook
//
//  Created by 양중창 on 2020/01/15.
//  Copyright © 2020 Jisng. All rights reserved.
//


import UIKit

struct TagModel {
    let name: String
    let image: UIImage
    let color: UIColor
}

enum TagEnum {
    
}

struct TagData {
    // 식비, 교통비, 휴대폰비, 공과금, 선물, 미용, 이자, 저금, 기타,
    static let foodTag = TagModel(name: "식사", image: UIImage(named: "")!, color:  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let transTag = TagModel(name: "교통", image: UIImage(named: "")!, color:  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let phoneTag = TagModel(name: "통신", image: UIImage(named: "")!, color:  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let billTag = TagModel(name: "공과금", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let giftTag = TagModel(name: "선물", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let beautyTag = TagModel(name: "미용", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let interestTag = TagModel(name: "이자", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let saveMoneyTag = TagModel(name: "저금", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let etcTage = TagModel(name: "기타", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    
    static let tags = [
        TagModel(name: "식사", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
        TagModel(name: "교통", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
        TagModel(name: "통신", image: UIImage(named: "")!, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    ]
}


