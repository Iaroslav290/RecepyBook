//
//  NowInTrendViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

import UIKit

let backButton = UIButton(type: .custom)


class NowInTrendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        configureElements()
        
        let backButtonImage = UIImage(named: "left-arrow")?.withRenderingMode(.alwaysOriginal)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        // Adjust the image size if needed
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
        
        
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true

        // Create a UIBarButtonItem with the custom UIButton as the custom view
        let backButtonBarButtonItem = UIBarButtonItem(customView: backButton)

        // Set the back button as the left bar button item of the navigation item
        navigationItem.leftBarButtonItem = backButtonBarButtonItem

    }

    func configureElements() {
        [trendLabel, NowInTrendCollectionView.shared].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            trendLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            trendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            
            NowInTrendCollectionView.shared.topAnchor.constraint(equalTo: trendLabel.bottomAnchor, constant: 20),
            NowInTrendCollectionView.shared.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            NowInTrendCollectionView.shared.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            NowInTrendCollectionView.shared.bottomAnchor.constraint(equalTo: view.bottomAnchor),



            
        ])
    }
    
    @objc func backButtonTapped() {
        // Handle the back button tap action here
        // For example, you can navigate back to the previous view controller
        navigationController?.popViewController(animated: true)
    }
}
