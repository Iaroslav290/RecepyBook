//
//  NewDishesStruct.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

import UIKit


struct NewDishesItem {
    var image: UIImage
    var name: String
    var description: String
}

let sushi7 = NewDishesItem(image: UIImage(named: "hamburger")!, name: "Chicago Burger", description: "Sweet burger with hot souse and a little bit of paprika")
let sushi8 = NewDishesItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi9 = NewDishesItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi10 = NewDishesItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi11 = NewDishesItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi12 = NewDishesItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")
let sushi13 = NewDishesItem(image: UIImage(named: "newDishes")!, name: "Sushi", description: "Amazing sushi with great taste")

var newDishes: [NewDishesItem] = [sushi7, sushi8, sushi9, sushi10, sushi11, sushi12, sushi13]

