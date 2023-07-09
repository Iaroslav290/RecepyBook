//
//  NowInTrendViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

import UIKit

class NowInTrendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        configureElements()
        


    }

    func configureElements() {
        [trendLabel, NowInTrendCollectionView.shared].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            trendLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            trendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            NowInTrendCollectionView.shared.topAnchor.constraint(equalTo: trendLabel.bottomAnchor, constant: 20),
            NowInTrendCollectionView.shared.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            NowInTrendCollectionView.shared.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            NowInTrendCollectionView.shared.bottomAnchor.constraint(equalTo: view.bottomAnchor),



            
        ])
    }
}
