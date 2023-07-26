//
//  MenuCollectionView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-30.
//


import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

var menuItems: [Product] = []

class MenuCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let shared = MenuCollectionView()
    
    var newDish: [Product] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = 15
        contentInset = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
//        fetchFoodData()
        getAllDishes { resulatArray in
            self.newDish = resulatArray
            
        }
        
   }
    
    
//    func fetchFoodData() {
//        let db = Firestore.firestore()
////        let foodRef = db.collection("food").document("meat").collection("beef")
//        
//        let foodRef = db.collection("food")
//
//        foodRef.getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error fetching food data: \(error.localizedDescription)")
//                return
//            }
//
//            guard let documents = querySnapshot?.documents else {
//                print("No documents found")
//                return
//            }
//
//            // Clear existing food items
//            self.newDish.removeAll()
//
//            // Loop through the documents and create FoodItem objects
//            for document in documents {
//                let data = document.data()
////                if let name = document.documentID as? String,
//                if let id = document.documentID as? String,
//                    let description = data["description"] as? String,
//                    let name = data["name"] as? String,
//                   let type = data["type"] as? String,
//                   let time = data["time"] as? String,
//                   let ingredients = data["ingridients"] as? [String],
//                    let recept = data["recept"] as? [String],
//                   let timestamp = data["timestamp"] as? Timestamp,
//                    let components = data["components"] as? [String],
//                   let cookTimes = data["cookTimes"] as? [Int]{
//                    
//                    
////                    let foodItem = FoodItem(name: name, description: description, imageURL: imageURL)
//                    let foodItem = Product(name: name, id: id, description: description, type: type, time: time, ingridients: ingredients, recept: recept, components: components, cookTimes: cookTimes, timestamp: timestamp)
//                    self.newDish.append(foodItem)
//                }
//            }
//
////            self.foodItems.sort { (item1, item2) in
////                        if item1.type == item2.type {
////                            // If the types are the same, sort by time
////                            return item1.time < item2.time
////                        } else {
////                            // If types are different, sort by type
////                            return item1.type < item2.type
////                        }
////                    }
//            
//            // Reload the collection view
//            self.reloadData()
//        }
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseId, for: indexPath) as! MenuCollectionViewCell
        
        let foodItem = menuItems[indexPath.row]
        
        
        cell.nameLabel.text = foodItem.name
//        cell.descriptionLabel.text = foodItem.description
        
       
        
        let storageRef = Storage.storage().reference().child("food/\(foodItem.id)")

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
        
       
        
        cell.backgroundColor = UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1)
        
        cell.layer.shadowColor = UIColor(red: 244/255, green: 100/255, blue: 0/255, alpha: 1).cgColor
        cell.layer.shadowRadius = 6
        cell.layer.shadowOpacity = 0.7
        cell.layer.shadowOffset = .init(width: 0, height: 0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width / 3.7, height: screenSize.width / 3.7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let selectedProduct = menuItems[indexPath.row]

               // Instantiate ProductViewController
        let productVC = ProductViewController(selectedProduct: selectedProduct)
               
               // Pass the selected product to ProductViewController
               
               // Present ProductViewController

        let newDishesVC = ProductViewController(selectedProduct: selectedProduct)
                if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                    navigationController.pushViewController(newDishesVC, animated: true)
                }
    }
    
}



