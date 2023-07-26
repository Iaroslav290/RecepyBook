//
//  TheMostPopularCollectionView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//



import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

var foodItems: [Product] = []


class TheMostPopularCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let shared = TheMostPopularCollectionView()
    
    weak var productViewController: ProductViewController?

    
    var selectedIndexPath: IndexPath?
    
    var wishlist: String?

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)

        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(TheMostPopularCollectionViewCell.self, forCellWithReuseIdentifier: TheMostPopularCollectionViewCell.reuseId)

        layout.minimumLineSpacing = 15
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false

        // Fetch the food data from Firestore
        fetchFoodData()
    }
    
    

    // Fetch food data from Firestore
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
            foodItems.removeAll()

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
                    foodItems.append(foodItem)
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
        return foodItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: TheMostPopularCollectionViewCell.reuseId, for: indexPath) as! TheMostPopularCollectionViewCell

        let foodItem = foodItems[indexPath.row]
//        guard let apiUrl = URL(string: foodItem.imageURL) else {
//            fatalError("Some error")
//        }
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: apiUrl) { (data, response, error) in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async {
//                // data = .jpeg
//                cell.imageView.image = UIImage(data: data)
//            }
//        }
//        // Start the task
//        task.resume()
//
        cell.nameLabel.text = foodItem.name
        
        cell.wishlistButton.tag = indexPath.row
        cell.wishlistButton.addTarget(self, action: #selector(wishListAction), for: .touchUpInside)
        
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
        

        if indexPath.row == 0 {
            // Customize the first cell
            cell.nameLabel.textAlignment = .center
            cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
            cell.backgroundColor = UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1)
            cell.descriptionLabel.text = foodItem.description

            cell.isFirstCell = true
        } else {
            // Reset properties for the remaining cells
            cell.nameLabel.textAlignment = .center
            cell.nameLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            cell.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
            cell.isFirstCell = false
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let selectedProduct = foodItems[indexPath.row]

               // Instantiate ProductViewController
        let productVC = ProductViewController(selectedProduct: selectedProduct)
               
               // Pass the selected product to ProductViewController
               
               // Present ProductViewController

        let newDishesVC = ProductViewController(selectedProduct: selectedProduct)
                if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                    navigationController.pushViewController(newDishesVC, animated: true)
                }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            // Size for the first cell
            return CGSize(width: 390, height: 390)
        } else {
            // Size for the remaining cells
            return CGSize(width: (frame.width - 50) / 2, height: 170)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    
    
    
    
    @objc func wishListAction(sender: UIButton) {
        let selectedProduct = foodItems[sender.tag]
        
        // Check if the item already exists in the Wishlist
        isItemInWishlist(selectedProduct) { itemExists in
            if itemExists {
                print("Item already exists in the Wishlist.")
            } else {
                // Add the item to the Wishlist
                self.addToWishlist(selectedProduct)
            }
        }
    }

    func isItemInWishlist(_ product: Product, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion(false) // If user is not logged in, consider item not in the Wishlist
            return
        }
        
        let db = Firestore.firestore()
        let wishlistRef = db.collection("users").document(uid).collection("wishlist")
        
        // Perform a query to check if the item's ID already exists in the Wishlist
        let query = wishlistRef.whereField("Id", isEqualTo: product.id).limit(to: 1)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error checking Wishlist: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            if let documents = querySnapshot?.documents, !documents.isEmpty {
                // If there's at least one document, the item exists in the Wishlist
                print("Item already exists in the Wishlist.")
                completion(true)
            } else {
                // Item does not exist in the Wishlist
                completion(false)
            }
        }
    }

    func addToWishlist(_ product: Product) {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not logged in.")
            return
        }
        
        let ref = Firestore.firestore()
        let convoId = UUID().uuidString
        
        let wishlistItem: [String: Any] = [
            "Id": product.id,
            "name": product.name,
            "description": product.description,
            "type": product.type,
            "time": product.time,
            "ingridients": product.ingridients,
            "recept": product.recept,
            "components": product.components,
            "cookTimes": product.cookTimes,
            "timestamp": FieldValue.serverTimestamp()
        ]
        
        ref.collection("users").document(uid).collection("wishlist").document(convoId).setData(wishlistItem) { error in
            if let error = error {
                print("Error adding item to Wishlist: \(error.localizedDescription)")
            } else {
                print("Item added to Wishlist successfully!")
            }
        }
    }


    
    
}


