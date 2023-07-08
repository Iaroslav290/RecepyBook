//
//  HomePageViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-05.
//

import UIKit




protocol ViewControllerDelegate {
    func toggleMenu()
}

var elementsOnScrollCollectionView = ElementsOnScrollCollectionView()

class HomePageViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    var tapGest: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
    }
    
    
    func configureElements() {
        [/*menuButton,*/ headlineText, cookedLabel, searchView, searchImage, searchTextField, elementsOnScrollCollectionView, wishListLabel, WishListCollectionView.shared].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
//        menuButton.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        
        headlineText.text = "Hi Dear"
        
        NSLayoutConstraint.activate([
//            menuButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -69),
//            menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            
            headlineText.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            headlineText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            cookedLabel.topAnchor.constraint(equalTo: headlineText.bottomAnchor, constant: 20),
            cookedLabel.leadingAnchor.constraint(equalTo: headlineText.leadingAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: cookedLabel.bottomAnchor, constant: 40),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 97),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -47),
            searchTextField.heightAnchor.constraint(equalToConstant: 59),
            
            searchView.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: -5),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchView.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 5),
            
            searchImage.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 12),
            searchImage.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 20),
            
            elementsOnScrollCollectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 30),
            elementsOnScrollCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            elementsOnScrollCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            elementsOnScrollCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            
            
            wishListLabel.topAnchor.constraint(equalTo: elementsOnScrollCollectionView.bottomAnchor, constant: 20),
            wishListLabel.leadingAnchor.constraint(equalTo: headlineText.leadingAnchor),

            WishListCollectionView.shared.topAnchor.constraint(equalTo: wishListLabel.bottomAnchor, constant: 20),
            WishListCollectionView.shared.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            WishListCollectionView.shared.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            WishListCollectionView.shared.bottomAnchor.constraint(equalTo: view.bottomAnchor),


            
        ])
    }
    
    @objc func openMenu() {
        delegate?.toggleMenu()
    }
    
    
}

