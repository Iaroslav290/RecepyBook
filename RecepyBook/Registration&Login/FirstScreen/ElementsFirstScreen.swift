//
//  ElementsFirstScreen.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-10.
//

import UIKit

let screenSize = UIScreen.main.bounds.size

let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = "Welcome to the"
    label.font = UIFont.systemFont(ofSize: screenSize.width / 12, weight: .semibold)
    label.textColor = .white
    return label
}()


let duckyLabel: UILabel = {
    let label = UILabel()
    label.text = "DuckyCook"
    label.font = UIFont.systemFont(ofSize: screenSize.width / 10, weight: .bold)
    label.textColor = UIColor(red: 255/255, green: 245/255, blue: 2/255, alpha: 1)
    return label
}()

let cookLabel: UILabel = {
    let label = UILabel()
    label.text = "Cook, learn and save"
    label.font = UIFont.systemFont(ofSize: screenSize.width / 14, weight: .semibold)
    label.textColor = .white
    return label
}()

let learnLabel: UILabel = {
    let label = UILabel()
    label.text = "Learn new dishes and get discounts on everything"
    label.font = UIFont.systemFont(ofSize: screenSize.width / 18, weight: .regular)
    label.numberOfLines = 0
    label.textColor = .white
    return label
}()

let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "logo")
    imageView.heightAnchor.constraint(equalToConstant: screenSize.height / 3).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: screenSize.height / 3).isActive = true
    return imageView
}()

let createButton: UIButton = {
   let button = UIButton()
    button.backgroundColor = UIColor(red: 184/255, green: 18/255, blue: 58/255, alpha: 1)
    button.setTitle("Create Account", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
    button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
    button.heightAnchor.constraint(equalToConstant: screenSize.height / 11.5).isActive = true
//    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
    button.layer.cornerRadius = (screenSize.height / 11.5) / 2
    return button
}()

let loginButton: UIButton = {
   let button = UIButton()
    button.backgroundColor = UIColor(red: 80/255, green: 43/255, blue: 158/255, alpha: 1)
    button.setTitle("Login", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
    button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
    button.heightAnchor.constraint(equalToConstant: screenSize.height / 11.5).isActive = true
//    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
    button.layer.cornerRadius = (screenSize.height / 11.5) / 2
    return button
}()


