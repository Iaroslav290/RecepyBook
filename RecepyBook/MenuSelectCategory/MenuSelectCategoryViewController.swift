//
//  MenuSelectCategoreViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-31.
//

import UIKit




class MenuSelectCategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        configureElements()
        
    }
    
    func configureElements() {
        [menuSelectLabel, MenuSelectCategoryCollectionView.shared].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            menuSelectLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            menuSelectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            MenuSelectCategoryCollectionView.shared.topAnchor.constraint(equalTo: menuSelectLabel.bottomAnchor, constant: 20),
            MenuSelectCategoryCollectionView.shared.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            MenuSelectCategoryCollectionView.shared.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            MenuCollectionView.shared.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MenuSelectCategoryCollectionView.shared.bottomAnchor.constraint(equalTo: view.bottomAnchor),



            
        ])
    }
}
