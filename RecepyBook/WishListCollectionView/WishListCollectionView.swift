//
//  WishListCollectionView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth


class WishListCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let shared = WishListCollectionView()
    
    var wishList: [Product] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(WishListCollectionViewCell.self, forCellWithReuseIdentifier: WishListCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = 15
        contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        fetchWishlistData()
        
        
   }
    
    
    func fetchWishlistData() {
        // Get the current user's ID or username (you'll need to have this information)
        guard let currentUserId = getCurrentUserIdOrUsername() else {
            // If user ID or username is not available, handle the error accordingly
            return
        }

        // Create a Firestore reference to the user's wishlist collection
        let db = Firestore.firestore()
        let wishlistRef = db.collection("users").document(currentUserId).collection("wishlist")

        // Fetch the wishlist items
        wishlistRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching wishlist data: \(error.localizedDescription)")
                return
            }

            guard let documents = querySnapshot?.documents else {
                print("No wishlist documents found")
                return
            }

            // Clear existing wishlist items
            self.wishList.removeAll()

            // Loop through the documents and create Product objects for wishlist items
            for document in documents {
                let data = document.data()
//                if let name = document.documentID as? String,
                if let id = data["Id"] as? String,
                    let description = data["description"] as? String,
                    let name = data["name"] as? String,
                   let type = data["type"] as? String,
                   let time = data["time"] as? String,
                   let ingredients = data["ingridients"] as? [String],
                    let recept = data["recept"] as? [String],
                   let timestamp = data["timestamp"] as? Timestamp,
                    let components = data["components"] as? [String],
                   let cookTimes = data["cookTimes"] as? [Int]{
                    
                    
//                    let foodItem = FoodItem(name: name, description: description, imageURL: imageURL)
                    let foodItem = Product(name: name, id: id, description: description, type: type, time: time, ingridients: ingredients, recept: recept, components: components, cookTimes: cookTimes, timestamp: timestamp)
                    self.wishList.append(foodItem)
                }
            }

            
            self.wishList.sort { (item1, item2) in
                        // Assuming time is in "HH:mm" format, you can convert it to Date like this
                        
                return item1.timestamp.dateValue() > item2.timestamp.dateValue()
                    }
            
            // Reload the collection view to display the fetched wishlist items
            self.reloadData()
        }
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wishList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: WishListCollectionViewCell.reuseId, for: indexPath) as! WishListCollectionViewCell
        let wishlistItem = wishList[indexPath.row]
        cell.nameLabel.text = wishlistItem.name
        cell.descriptionLabel.text = wishlistItem.description
        cell.backgroundColor = .clear
        
        
        let storageRef = Storage.storage().reference().child("food/\(wishlistItem.id)")

                storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if let error = error {
                        print("Error downloading image: \(error.localizedDescription)")
                        // Handle the error appropriately (e.g., show a placeholder image)
                    } else {
                        // Image data is available in 'data', you can convert it to UIImage or use it as needed
                        if let image = UIImage(data: data!) {
                            // Do something with the image (e.g., display it in the cell's ImageView)
                            cell.imageView.image = image
                        }
                    }
                }
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let selectedProduct = wishList[indexPath.row]

               // Instantiate ProductViewController
//        let productVC = ProductViewController(selectedProduct: selectedProduct)
               
               // Pass the selected product to ProductViewController
               
               // Present ProductViewController

        let newDishesVC = ProductViewController(selectedProduct: selectedProduct)
                if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                    navigationController.pushViewController(newDishesVC, animated: true)
                }
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 90)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getCurrentUserIdOrUsername() -> String? {
            // Implement the logic to get the current user's ID or username here
            // For example, if you are using Firebase Authentication:
            if let currentUser = Auth.auth().currentUser {
                return currentUser.uid // Return the UID of the current user
            }
            // If using username, return the username instead of UID
            return nil // Return nil if user not logged in
        }
    
}
