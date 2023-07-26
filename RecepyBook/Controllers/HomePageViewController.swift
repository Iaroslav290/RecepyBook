//
//  HomePageViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-05.
//

import UIKit
import Firebase




protocol ViewControllerDelegate {
    func toggleMenu()
}

var elementsOnScrollCollectionView = ElementsOnScrollCollectionView()

class HomePageViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    
    
//    let pieChartDataEntries: [PieChartDataEntry] = [
//            PieChartDataEntry(value: 30, color: UIColor.blue),
//            PieChartDataEntry(value: 50, color: UIColor.green),
//            PieChartDataEntry(value: 20, color: UIColor.red)
//        ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            // Fetch the wishlist data each time the view appears
        WishListCollectionView.shared.fetchWishlistData()
        }
    
    func configureElements() {
        [/*menuButton,*/ headlineText, cookedLabel, searchView, searchImage, searchTextField, elementsOnScrollCollectionView, wishListLabel, WishListCollectionView.shared, /*pieChart*/].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
//                pieChart.dataEntries = pieChartDataEntries
              
        
//        menuButton.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {
                // No user is currently signed in
                return
            }

            let db = Firestore.firestore()
            let usersCollection = db.collection("users")
            let currentUserDoc = usersCollection.document(currentUserID)

            currentUserDoc.getDocument { (document, error) in
                if let document = document, document.exists {
                    if let username = document.data()?["username"] as? String {
                        print("Current user's username: \(username)")
                        headlineText.text = "Hi \(username)"
                        // You can use the username here as needed
                    } else {
                        print("Username not found for the current user")
                    }
                } else {
                    print("Document does not exist or there was an error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        
        
//        headlineText.text = "Hi " + (Auth.auth().currentUser!)
        
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

            
//            pieChart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                        pieChart.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                        pieChart.widthAnchor.constraint(equalToConstant: 200),
//                        pieChart.heightAnchor.constraint(equalToConstant: 200)

            
        ])
    }
    
   
    
    
}

