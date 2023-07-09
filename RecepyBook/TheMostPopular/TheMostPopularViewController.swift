//
//  TheMostPopularViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

import UIKit

class TheMostPopularViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        configureElements()
        

    }

    func configureElements() {
        [popularLabel, TheMostPopularCollectionView.shared].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            popularLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            popularLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            TheMostPopularCollectionView.shared.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 20),
            TheMostPopularCollectionView.shared.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            TheMostPopularCollectionView.shared.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            TheMostPopularCollectionView.shared.bottomAnchor.constraint(equalTo: view.bottomAnchor),



            
        ])
    }
}

