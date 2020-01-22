//
//  TagData.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/22.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

struct TagModel {
    let name: String
    let color: UIColor
    let tag: Tags
}

enum Tags {
    case food
    case trans
    case phone
    case bill
    case present
    case beauty
    case interset
    case save
    case etc
    
    static var list: [TagModel] {
        get {
            return [
                TagModel(name: "식사", color: #colorLiteral(red: 0.6341673732, green: 0.8130221963, blue: 0.9294165969, alpha: 1), tag: .food),
                TagModel(name: "교통", color: #colorLiteral(red: 0.9764111638, green: 0.9074609876, blue: 0.8522706628, alpha: 1), tag: .trans),
                TagModel(name: "통신", color: #colorLiteral(red: 0.8951025605, green: 0.7146639824, blue: 0.8171000481, alpha: 1), tag: .phone),
                TagModel(name: "공과금", color: #colorLiteral(red: 0.1268284619, green: 0.6526806951, blue: 0.7871559262, alpha: 1), tag: .bill),
                TagModel(name: "선물", color:  #colorLiteral(red: 0.02159192972, green: 0.4183322191, blue: 0.6206336617, alpha: 1), tag: .present),
                TagModel(name: "미용", color:  #colorLiteral(red: 0.4928416014, green: 0.884049952, blue: 0.8057829738, alpha: 1), tag: .beauty),
                TagModel(name: "이자", color:  #colorLiteral(red: 0.7262660861, green: 0.5991876721, blue: 0.7680996656, alpha: 1), tag: .interset),
                TagModel(name: "저금", color:  #colorLiteral(red: 0.6071969867, green: 0.5970490575, blue: 0.932897985, alpha: 1), tag: .save),
                TagModel(name: "기타", color:  #colorLiteral(red: 0.6328347325, green: 0.6880624294, blue: 0.7724642158, alpha: 1), tag: .etc)
            ]
        }
    }
    
    func returnTag() -> TagModel { Tags.list.filter { $0.tag == self }[0] }
}
