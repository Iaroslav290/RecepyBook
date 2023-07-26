//
//  MenuViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-30.
//

import UIKit



class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        configureElements()
        
    }
    
    func configureElements() {
        [menuLabel, MenuCollectionView.shared].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            menuLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            menuLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            MenuCollectionView.shared.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: 20),
            MenuCollectionView.shared.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            MenuCollectionView.shared.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            MenuCollectionView.shared.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MenuCollectionView.shared.bottomAnchor.constraint(equalTo: view.bottomAnchor),



            
        ])
    }
}
