//
//  MenuModel.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import Foundation
import UIKit

enum MenuModel: Int, CustomStringConvertible {
    
    
    
    case Profile
    case Wishlist
    case Menu
    case Contacts
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Wishlist: return "Wishlist"
        case .Menu: return "Menu"
        case .Contacts: return "Contacts"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "Profile") ?? UIImage()
        case .Wishlist: return UIImage(named: "Wishlist") ?? UIImage()
        case .Menu: return UIImage(named: "DishesMenu") ?? UIImage()
        case .Contacts: return UIImage(named: "Contacts") ?? UIImage()
        case .Settings: return UIImage(named: "Settings") ?? UIImage()
        }
    }
}
