//
//  MenuSelectCategoryCollectionView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-31.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

var menuDishes: [Product] = []


class MenuSelectCategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let shared = MenuSelectCategoryCollectionView()
    
    
    var newDish: [Product] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(MenuSelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MenuSelectCategoryCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = 15
        
        
        
        contentInset = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        
        
        // Set the contentInset with the calculated left inset
        //        if isFirstItem != false{
        //            contentInset = UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 20)
        //        }else {
        //            contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        //        }
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        
//        fetchFoodData()
        getAllDishes { resulatArray in
            menuDishes = resulatArray
            
        }
    }
    
    
    
    
    func fetchFoodData() {
        let db = Firestore.firestore()
        //        let foodRef = db.collection("food").document("meat").collection("beef")
        
        let foodRef = db.collection("food")
        
        foodRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching food data: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            // Clear existing food items
            menuDishes.removeAll()
            
            // Loop through the documents and create FoodItem objects
            for document in documents {
                let data = document.data()
                //                if let name = document.documentID as? String,
                if let id = document.documentID as? String,
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
                    menuDishes.append(foodItem)
                }
            }
            
            //            self.foodItems.sort { (item1, item2) in
            //                        if item1.type == item2.type {
            //                            // If the types are the same, sort by time
            //                            return item1.time < item2.time
            //                        } else {
            //                            // If types are different, sort by type
            //                            return item1.type < item2.type
            //                        }
            //                    }
            
            // Reload the collection view
            self.reloadData()
            
            
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeOfDishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MenuSelectCategoryCollectionViewCell.reuseId, for: indexPath) as! MenuSelectCategoryCollectionViewCell
        
        //        let foodItem = newDish[indexPath.row]
        //        
        //        
        //        cell.nameLabel.text = foodItem.name
        ////        cell.descriptionLabel.text = foodItem.description
        //        
        //       
        //        
        //        let storageRef = Storage.storage().reference().child("food/\(foodItem.id)")
        //
        //                storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
        //                    if let error = error {
        //                        print("Error downloading image: \(error.localizedDescription)")
        //                        // Handle the error appropriately (e.g., show a placeholder image)
        //                    } else {
        //                        // Image data is available in 'data', you can convert it to UIImage or use it as needed
        //                        if let image = UIImage(data: data!) {
        //                            // Do something with the image (e.g., display it in the cell's ImageView)
        //                            cell.imageView.image = image
        //                        }
        //                    }
        //                }
        //        
        //       
        //        
        //        cell.backgroundColor = UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1)
        //        
        //        cell.layer.shadowColor = UIColor(red: 244/255, green: 100/255, blue: 0/255, alpha: 1).cgColor
        //        cell.layer.shadowRadius = 6
        //        cell.layer.shadowOpacity = 0.7
        //        cell.layer.shadowOffset = .init(width: 0, height: 0)
        
        
        
        
        
        
        cell.imageView.image = typeOfDishes[indexPath.row].image
        cell.nameLabel.text = typeOfDishes[indexPath.row].title
        cell.backgroundColor = typeOfDishes[indexPath.row].backgroundColor
        
        //        NSLayoutConstraint.activate([
        //            cell.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        //            cell.imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        //            cell.imageView.heightAnchor.constraint(equalToConstant: screenSize.width / 7),
        //            cell.imageView.widthAnchor.constraint(equalToConstant: screenSize.width / 7),
        //            
        //            cell.nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        //            cell.nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
        //            
        //           
        //        ])
        
        
        
        if indexPath.row == 0 {
            // Customize the first cell
            
            
            
            cell.isFirstCell = true
        } else {
            // Reset properties for the remaining cells
            
            
            
            cell.isFirstCell = false
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width / 1.2, height: screenSize.width / 3.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        menuItems.removeAll()
        
        menuItems = menuDishes.filter { $0.type == typeOfDishes[indexPath.row].title}
        
        MenuCollectionView.shared.reloadData()
        
        let newDishesVC = MenuViewController()
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.pushViewController(newDishesVC, animated: true)
        }

        }
        
        //        switch indexPath.item {
        //        case 0: print("1")
        ////            let newDishesVC = NewDishesViewController()
        ////
        ////                    // Retrieve the current view controller
        ////                    guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
        ////                        return
        ////                    }
        ////
        ////                    // Add the view of newDishesVC as a subview to the current view controller's view
        ////                    viewController.view.addSubview(newDishesVC.view)
        ////
        ////                    // Set the appropriate frame for the subview
        ////                    newDishesVC.view.frame = viewController.view.bounds
        ////
        ////                    // Call the viewDidLoad() method manually
        ////                    newDishesVC.viewDidLoad()
        //            
        //            
        //            menuItems.removeAll()
        //            menuItems = menuDishes.filter { $0.time == "50"}
        //            
        //            MenuCollectionView.shared.reloadData()
        //
        //            
        //            let newDishesVC = MenuViewController()
        //                    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
        //                        navigationController.pushViewController(newDishesVC, animated: true)
        //                    }
        //            
        //           
        //        case 1: print("2")
        //            
        //            
        //            menuItems.removeAll()
        //
        //            menuItems = menuDishes.filter { $0.time == "45"}
        //            
        //            MenuCollectionView.shared.reloadData()
        //            
        //            let newDishesVC = MenuViewController()
        //                    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
        //                        navigationController.pushViewController(newDishesVC, animated: true)
        //                    }
        //        case 2:
        //            let newDishesVC = TheMostPopularViewController()
        //                    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
        //                        navigationController.pushViewController(newDishesVC, animated: true)
        //                    }
        //        default: break
        //        }
        //        
        //    }
        
        
    }
    
    
    

