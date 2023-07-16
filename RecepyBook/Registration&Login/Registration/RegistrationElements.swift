//
//  RegistrationElements.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-10.
//

import UIKit


let registrationLabel: UILabel = {
   let label = UILabel()
    label.text = "REGISTER"
    label.font = UIFont(name: "JetBrainsMono-Regular", size: 40)
    label.textColor = .white
    return label
}()

let usernameFieldRegistration: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "email"
    textField.layer.cornerRadius = (screenSize.height / 11.5) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 11.5)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()


let emailFieldRegistration: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "email"
    textField.layer.cornerRadius = (screenSize.height / 11.5) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 11.5)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()

let passwordFieldRegistration: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "password"
    textField.layer.cornerRadius = (screenSize.height / 11.5) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 11.5)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()

let repeatPasswordFieldRegistration: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Repeat Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "password"
    textField.layer.cornerRadius = (screenSize.height / 11.5) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 11.5)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()



let registrationButton: UIButton = {
   let button = UIButton()
    button.backgroundColor = UIColor(red: 80/255, green: 43/255, blue: 158/255, alpha: 1)
    button.setTitle("Register", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: (screenSize.height / 19), weight: .bold)
    button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
    button.heightAnchor.constraint(equalToConstant: (screenSize.height / 11.5)).isActive = true
//    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
    button.layer.cornerRadius = (screenSize.height / 11.5) / 2
    return button
}()

