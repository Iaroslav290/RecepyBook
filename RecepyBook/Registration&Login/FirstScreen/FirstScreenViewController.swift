//
//  FirstScreenViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-10.
//

import UIKit



class FirstScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)

    }
    
    
    func configureElements() {
        [welcomeLabel, duckyLabel, cookLabel, learnLabel, imageView, createButton, loginButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            duckyLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 0),
            duckyLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            cookLabel.topAnchor.constraint(equalTo: duckyLabel.bottomAnchor, constant: 20),
            cookLabel.leadingAnchor.constraint(equalTo: duckyLabel.leadingAnchor),
            
            learnLabel.topAnchor.constraint(equalTo: cookLabel.bottomAnchor, constant: 20),
            learnLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            learnLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            
            imageView.topAnchor.constraint(equalTo: learnLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            createButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
}
