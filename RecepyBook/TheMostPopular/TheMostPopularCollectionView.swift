//
//  TheMostPopularCollectionView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

//import UIKit
//
//
//class TheMostPopularCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    static let shared = TheMostPopularCollectionView()
//
//    init() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        super.init(frame: .zero, collectionViewLayout: layout)
//
//        backgroundColor = .clear
//        delegate = self
//        dataSource = self
//        register(TheMostPopularCollectionViewCell.self, forCellWithReuseIdentifier: TheMostPopularCollectionViewCell.reuseId)
//
//        layout.minimumLineSpacing = 15
//        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
//
//        showsHorizontalScrollIndicator = false
//        showsVerticalScrollIndicator = false
//   }
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return wishList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = dequeueReusableCell(withReuseIdentifier: TheMostPopularCollectionViewCell.reuseId, for: indexPath) as! TheMostPopularCollectionViewCell
//        cell.imageView.image = theMostPopular[indexPath.row].image
//        cell.nameLabel.text = theMostPopular[indexPath.row].name
////        cell.descriptionLabel.text = nowInTrend[indexPath.row].description
//
//        if indexPath.row == 0 {
//                // Customize the first cell
//            cell.descriptionLabel.text = theMostPopular[indexPath.row].description
//                cell.nameLabel.textAlignment = .center
//                cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
//            cell.backgroundColor = UIColor(red: 244/255, green: 254/255, blue: 253/255, alpha: 1)
//
//            cell.isFirstCell = true
//
//
//            } else {
//                // Reset properties for the remaining cells
//            cell.nameLabel.textAlignment = .center
//            cell.nameLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
//                cell.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
//
//                cell.isFirstCell = false
//
//            }
//
//
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row == 0 {
//                // Size for the first cell
//                return CGSize(width: 390, height: 390)
//            } else {
//                // Size for the remaining cells
//                return CGSize(width: (frame.width - 50) / 2, height: 170)
//            }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//
//
//}


import UIKit
import FirebaseFirestore
import FirebaseStorage

class FoodItem {
    let name: String
    let description: String
    let imageURL: String

    init(name: String, description: String, imageURL: String) {
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }
}

class TheMostPopularCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let shared = TheMostPopularCollectionView()
    
    weak var productViewController: ProductViewController?

    var foodItems: [Product] = []

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
            self.foodItems.removeAll()

            // Loop through the documents and create FoodItem objects
            for document in documents {
                let data = document.data()
//                if let name = document.documentID as? String,
                if let id = document.documentID as? String,
                    let description = data["description"] as? String,
                    let name = data["name"] as? String {
//                    let foodItem = FoodItem(name: name, description: description, imageURL: imageURL)
                    let foodItem = Product(name: name, id: id, description: description)
                    self.foodItems.append(foodItem)
                }
            }

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
        
        let storageRef = Storage.storage().reference().child("food/")
        
        storageRef.listAll { result, error in
            if let error = error {
                print("Error listing images: \(error.localizedDescription)")
                // Handle the error appropriately (e.g., show an error message to the user)
            } else {
                // 'result.items' contains an array of all images inside the "food" folder
                for imageRef in result!.items {
                    // Download each image in the folder
                    imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("Error downloading image: \(error.localizedDescription)")
                            // Handle the error appropriately (e.g., show an error message to the user)
                        } else {
                            // Image data is available in 'data', you can convert it to UIImage or use it as needed
                            if let image = UIImage(data: data!) {
                                // Do something with the image (e.g., display it in an ImageView)
                                cell.imageView.image = image
                            }
                        }
                    }
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

}


