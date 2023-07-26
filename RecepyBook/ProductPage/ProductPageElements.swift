//
//  ProductPageElements.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-23.
//

import UIKit


let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "logo")
//    imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//    imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    imageView.contentMode = .scaleAspectFit
    return imageView
}()

let productLabel: UILabel = {
   let label = UILabel()
    label.text = "LOGIN"
    label.font = UIFont(name: "JetBrainsMonoNL-Bold", size: 40)
    label.textColor = .white
    return label
}()


let productDescription: UILabel = {
   let label = UILabel()
    label.text = "Description"
    label.font = UIFont(name: "JetBrainsMono-SemiBold", size: 22)
    label.textColor = .white
    label.numberOfLines = 0
    return label
}()

let ingredientsLabel: UILabel = {
   let label = UILabel()
    label.text = "Ingredients"
    label.font = UIFont(name: "JetBrainsMono-SemiBold", size: 25)
    label.textColor = .white
    return label
}()

let productIngredients: UILabel = {
    let label = UILabel()
     label.text = "Ingredients"
     label.font = UIFont(name: "JetBrainsMono-Regular", size: 20)
     label.textColor = .white
     label.numberOfLines = 0
     return label
 }()

let recipeLabel: UILabel = {
   let label = UILabel()
    label.text = "Recipe"
    label.font = UIFont(name: "JetBrainsMono-SemiBold", size: 25)
    label.textColor = .white
    return label
}()

let productRecept: UILabel = {
    let label = UILabel()
     label.text = "Recept"
     label.font = UIFont(name: "JetBrainsMono-Regular", size: 20)
     label.textColor = .white
     label.numberOfLines = 0
     return label
}()

let startButton: UIButton = {
    let button = UIButton()
    button.setTitle("Start", for: .normal)
    button.backgroundColor = .green
    button.setTitleColor(.black, for: .normal)
    return button
}()
