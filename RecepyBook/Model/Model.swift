//
//  Model.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-19.
//

import UIKit

enum AuthResponce {
    case success, noVerify, error
}

struct Slides {
    var id: Int
    var text: String
    var img: UIImage
}

struct RegisterField {
    var username: String
    var email: String
    var password: String
}

struct LoginField {
    var email: String
    var password: String
}

struct ResponseCode {
    var code: Int
}


struct CurrentUser {
    var id: String
    var email: String
}


struct PieChartDataEntry {
    let value: CGFloat
    let color: UIColor
}

//struct WishlistItem {
//    var id: String
//    var name: String
//    var description: String
//}


//struct WishlistProduct {
//    var name: String
//    var id: String
//    var description: String
//    var type: String
//    var time: String
//    var ingridients: [String]
//    
//    var recept: [String]
//    
//    var timestamp: Date
//    
//}




