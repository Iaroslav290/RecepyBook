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
