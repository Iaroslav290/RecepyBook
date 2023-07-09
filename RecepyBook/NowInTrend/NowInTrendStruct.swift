//
//  NowInTrendStruct.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

import UIKit


struct NowInTrendItem {
    var image: UIImage
    var name: String
    var description: String
}

let sushi70 = NowInTrendItem(image: UIImage(named: "hamburger")!, name: "Chicago Burger", description: "Sweet burger with hot souse and a little bit of paprika")
let sushi80 = NowInTrendItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi90 = NowInTrendItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi100 = NowInTrendItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi110 = NowInTrendItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi120 = NowInTrendItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi130 = NowInTrendItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")

var nowInTrend: [NowInTrendItem] = [sushi70, sushi80, sushi90, sushi100, sushi110, sushi120, sushi130]

