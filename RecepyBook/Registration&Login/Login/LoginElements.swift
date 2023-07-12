//
//  LoginElements.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-10.
//

import UIKit


let logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "logo")
    imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    return imageView
}()


let emailField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: " email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "ChalkboardSE-Regular", size: 40) // Set the font name and size
    textField.restorationIdentifier = "email"
    textField.layer.cornerRadius = 40
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: 80).isActive = true
    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    return textField
}()

let passwordField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: " password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont.systemFont(ofSize: 40)
    textField.restorationIdentifier = "password"
    textField.layer.cornerRadius = 40
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: 80).isActive = true
    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    return textField
}()


