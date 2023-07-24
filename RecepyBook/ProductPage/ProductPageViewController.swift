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
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        //        for family in UIFont.familyNames.sorted() {
        //            let names = UIFont.fontNames(forFamilyName: family)
        //            print("Family: \(family) Font names: \(names)")
        //        }
        
        
        if let product = selectedProduct {
//                    productImageView.image = UIImage(named: selectedProduct.imageURL)
                    productLabel.text = product.name
                    productDescription.text = product.description
            
            let storageRef = Storage.storage().reference().child("food/")

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
    
    
    func configureElements() {
        [productImageView, productLabel, productDescription].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            productImageView.heightAnchor.constraint(equalToConstant: screenSize.width / 1.65),
            productImageView.widthAnchor.constraint(equalToConstant: screenSize.width / 1.65),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.bottomAnchor.constraint(equalTo: productLabel.topAnchor, constant: -(screenSize.height / 70)),
            
            
            productLabel.bottomAnchor.constraint(equalTo: productDescription.topAnchor, constant: -(screenSize.height / 30)),
            productLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            productDescription.topAnchor.constraint(equalTo: view.centerYAnchor),
            productDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            productDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
            
            
        ])
    }
    
}
