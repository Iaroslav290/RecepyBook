//
//  MenuSelectCategoryStruct.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-31.
//

import UIKit




struct MenuSelectCategoryElement {
    var image: UIImage
    var title: String
    var backgroundColor: UIColor
}




let dessert = MenuSelectCategoryElement(image: UIImage(named: "dessert")!, title: "Desserts", backgroundColor: UIColor(red: 24/255, green: 254/255, blue: 253/255, alpha: 1))

let mainDish = MenuSelectCategoryElement(image: UIImage(named: "mainCourse")!, title: "Main Dishes", backgroundColor: UIColor(red: 14/255, green: 246/255, blue: 204/255, alpha: 1))

let drinks = MenuSelectCategoryElement(image: UIImage(named: "drinks")!, title: "Drinks", backgroundColor: UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1))

let hors = MenuSelectCategoryElement(image: UIImage(named: "hors")!, title: "Hors", backgroundColor: UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1))

let appetizer = MenuSelectCategoryElement(image: UIImage(named: "appetizer")!, title: "Appetizer", backgroundColor: UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1))

let salad = MenuSelectCategoryElement(image: UIImage(named: "salad")!, title: "Salad", backgroundColor: UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1))

let soup = MenuSelectCategoryElement(image: UIImage(named: "soup")!, title: "Soup", backgroundColor: UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1))

var typeOfDishes: [MenuSelectCategoryElement] = [dessert, mainDish, drinks, hors, appetizer, salad, soup]
