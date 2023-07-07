//
//  HotLineStackView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-05.
//

import UIKit


struct QuickAccessLineElement {
    var image: UIImage
    var title: String
    var backgroundColor: UIColor
}




let newDishesElemeny = QuickAccessLineElement(image: UIImage(named: "newDishes")!, title: "New dishes", backgroundColor: UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1))

let nowInTrendElement = QuickAccessLineElement(image: UIImage(named: "nowInTrend")!, title: "Now in trend", backgroundColor: UIColor(red: 14/255, green: 246/255, blue: 204/255, alpha: 1))

var quickElements: [QuickAccessLineElement] = [newDishesElemeny, nowInTrendElement]
