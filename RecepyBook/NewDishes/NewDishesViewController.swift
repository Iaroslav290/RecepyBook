//
//  NewDishesViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

import UIKit

class NewDishesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        configureElements()
        

    }

    func configureElements() {
        [newDishesLabel, NewDishesCollectionView.shared].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            newDishesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            newDishesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            NewDishesCollectionView.shared.topAnchor.constraint(equalTo: newDishesLabel.bottomAnchor, constant: 20),
            NewDishesCollectionView.shared.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            NewDishesCollectionView.shared.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            NewDishesCollectionView.shared.bottomAnchor.constraint(equalTo: view.bottomAnchor),



            
        ])
    }
}
