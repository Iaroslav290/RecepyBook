//
//  SettingsElements.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-20.
//

import UIKit

let signOutButton: UIButton = {
    let button = UIButton()
     button.backgroundColor = UIColor(red: 80/255, green: 43/255, blue: 158/255, alpha: 1)
     button.setTitle("SignOut", for: .normal)
     button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
     button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
     button.heightAnchor.constraint(equalToConstant: 80).isActive = true
 //    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
     button.layer.cornerRadius = 40
     return button
}()
