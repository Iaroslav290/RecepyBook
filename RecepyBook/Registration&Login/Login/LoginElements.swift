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
//    imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//    imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    imageView.contentMode = .scaleAspectFit
    return imageView
}()

let loginLabel: UILabel = {
   let label = UILabel()
    label.text = "LOGIN"
    label.font = UIFont(name: "JetBrainsMono-Regular", size: 40)
    label.textColor = .white
    return label
}()


let emailField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "email"
    textField.layer.cornerRadius = 40
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: 80).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
        textField.rightView = paddingView
        textField.rightViewMode = .always
    
    return textField
}()

let passwordField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "password"
    textField.layer.cornerRadius = 40
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: 80).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()



let loginButton2: UIButton = {
   let button = UIButton()
    button.backgroundColor = UIColor(red: 80/255, green: 43/255, blue: 158/255, alpha: 1)
    button.setTitle("Login", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
    button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
    button.heightAnchor.constraint(equalToConstant: 80).isActive = true
//    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
    button.layer.cornerRadius = 40
    return button
}()
