//
//  LoginViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-11.
//

import UIKit


class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }

    }
    
    
    func configureElements() {
        [logoImageView, emailField, passwordField].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 60),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            

        ])
    }
}

