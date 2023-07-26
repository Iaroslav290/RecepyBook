//
//  ProductPageViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-23.
//

import UIKit
import FirebaseStorage



class ProductViewController: UIViewController {
    
    
    var selectedProduct: Product?
    
    init(selectedProduct: Product) {
            self.selectedProduct = selectedProduct
        print(selectedProduct.name)
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        //        for family in UIFont.familyNames.sorted() {
        //            let names = UIFont.fontNames(forFamilyName: family)
        //            print("Family: \(family) Font names: \(names)")
        //        }
        
        let scrollView = UIScrollView()
                scrollView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(scrollView)
                
                // Add your content view to the scroll view
                let contentView = UIView()
                contentView.translatesAutoresizingMaskIntoConstraints = false
                scrollView.addSubview(contentView)
                
                // Add elements to contentView
                [productImageView, productLabel, productDescription, ingredientsLabel, productIngredients, recipeLabel, productRecept].forEach {
                    contentView.addSubview($0)
                    $0.translatesAutoresizingMaskIntoConstraints = false
                }
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
                
                // Setup constraints for scroll view and contentView
                NSLayoutConstraint.activate([
                    scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    
                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
                ])
        
        NSLayoutConstraint.activate([
                   productImageView.heightAnchor.constraint(equalToConstant: screenSize.width / 1.65),
                   productImageView.widthAnchor.constraint(equalToConstant: screenSize.width / 1.65),
                   productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                   productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (screenSize.height / 60)),
                   
                   productLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: (screenSize.height / 60)),
                   productLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                   
//                   productDescription.topAnchor.constraint(equalTo: contentView.centerYAnchor),
//                   productDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                   productDescription.topAnchor.constraint(equalTo: productLabel.bottomAnchor),
                   productDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: (screenSize.width / 10)),
                   productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(screenSize.width / 10)),
                   
                   ingredientsLabel.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: (screenSize.height / 50)),
                   ingredientsLabel.leadingAnchor.constraint(equalTo: productDescription.leadingAnchor),
                   ingredientsLabel.trailingAnchor.constraint(equalTo: productDescription.trailingAnchor),
                   
                   productIngredients.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 10),
                   productIngredients.leadingAnchor.constraint(equalTo: ingredientsLabel.leadingAnchor),
                   productIngredients.trailingAnchor.constraint(equalTo: ingredientsLabel.trailingAnchor),
                   
                   recipeLabel.topAnchor.constraint(equalTo: productIngredients.bottomAnchor, constant: (screenSize.height / 40)),
                   recipeLabel.leadingAnchor.constraint(equalTo: productIngredients.leadingAnchor),
                   recipeLabel.trailingAnchor.constraint(equalTo: productIngredients.trailingAnchor),
                   
                   productRecept.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 10),
                   productRecept.leadingAnchor.constraint(equalTo: recipeLabel.leadingAnchor),
                   productRecept.trailingAnchor.constraint(equalTo: recipeLabel.trailingAnchor),
                   
                   startButton.widthAnchor.constraint(equalToConstant: 50),
                   startButton.heightAnchor.constraint(equalToConstant: 50),
                   startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                   startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),

               ])
        
        contentView.bottomAnchor.constraint(equalTo: productRecept.bottomAnchor, constant: 20).isActive = true

        
        
        if let product = selectedProduct {
//                    productImageView.image = UIImage(named: selectedProduct.imageURL)
                    productLabel.text = product.name
                    productDescription.text = product.description
//            productDescription.text = "Ingredients: " + product.ingridients.joined(separator: ", ")
            productIngredients.text = product.formattedIngredients

            productImageView.image = UIImage(named: "logo")
            
            productRecept.text = product.formattedRecept
            
            let storageRef = Storage.storage().reference().child("food/\(product.id)")

                       storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                           if let error = error {
                               print("Error downloading image: \(error.localizedDescription)")
                               // Handle the error appropriately (e.g., show a placeholder image)
                           } else {
                               // Image data is available in 'data', you can convert it to UIImage or use it as needed
                               if let image = UIImage(data: data!) {
                                   // Update the ImageView with the fetched image
                                   productImageView.image = image
                               }
                           }
                       }
            
        } else {
            productLabel.text = "Error"
        }
        
        
        
    }
    
    @objc func startAction() {
        //        startButton.isEnabled = false
        if let product = selectedProduct {
                // Check if the CookingViewController is already on the navigation stack
                if !(navigationController?.topViewController is CookingViewController) {
                    let newDishesVC = CookingViewController(selectedProduct: product)
                    navigationController?.pushViewController(newDishesVC, animated: true)
                }
            }
    }
            
//            let cookingVC = CookingViewController(selectedProduct: product)
//            navigationController?.setViewControllers([cookingVC], animated: true)
            
            //        startButton.isEnabled = true
        
    

    
    
//    func configureElements() {
//        [productImageView, productLabel, productDescription, ingredientsLabel, productIngredients, recipeLabel, productRecept].forEach{
//            view.addSubview($0)
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//        
//        
//        
//        
//        NSLayoutConstraint.activate([
//            
//            productImageView.heightAnchor.constraint(equalToConstant: screenSize.width / 1.65),
//            productImageView.widthAnchor.constraint(equalToConstant: screenSize.width / 1.65),
//            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            productImageView.bottomAnchor.constraint(equalTo: productLabel.topAnchor, constant: -(screenSize.height / 60)),
//            
//            
//            productLabel.bottomAnchor.constraint(equalTo: productDescription.topAnchor, constant: -(screenSize.height / 60)),
//            productLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            
//            productDescription.topAnchor.constraint(equalTo: view.centerYAnchor),
//            productDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            productDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
//            productDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
//            
//            ingredientsLabel.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: (screenSize.height / 50)),
//            ingredientsLabel.leadingAnchor.constraint(equalTo: productDescription.leadingAnchor),
//            ingredientsLabel.trailingAnchor.constraint(equalTo: productDescription.trailingAnchor),
//            
//            productIngredients.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 10),
//            productIngredients.leadingAnchor.constraint(equalTo: ingredientsLabel.leadingAnchor),
//            productIngredients.trailingAnchor.constraint(equalTo: ingredientsLabel.trailingAnchor),
//            
//            recipeLabel.topAnchor.constraint(equalTo: productIngredients.bottomAnchor, constant: (screenSize.height / 40)),
//            recipeLabel.leadingAnchor.constraint(equalTo: productIngredients.leadingAnchor),
//            recipeLabel.trailingAnchor.constraint(equalTo: productIngredients.trailingAnchor),
//            
//            
//            
//            productRecept.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 10),
//            productRecept.leadingAnchor.constraint(equalTo: recipeLabel.leadingAnchor),
//            productRecept.trailingAnchor.constraint(equalTo: recipeLabel.trailingAnchor),
//            
//        ])
//    }
    
}
