//
//  MenuButton.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-05.
//

import UIKit

let menuButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
    button.layer.cornerRadius = 45/2
//    button.setImage(UIImage(named: "menu"), for: .normal)
    let buttonImage = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        
        // Adjust the image size
        let imageSize = buttonImage?.size ?? CGSize.zero
        let scaledImageSize = CGSize(width: 25, height: 25)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: (45 - scaledImageSize.height) / 2, left: (45 - scaledImageSize.width) / 2, bottom: (45 - scaledImageSize.height) / 2, right: (45 - scaledImageSize.width) / 2)
        
    button.widthAnchor.constraint(equalToConstant: 45).isActive = true
    button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    
    return button
}()


let headlineText: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
    label.textColor = .white
    return label
}()


let searchTextField: UITextField = {
    let field = UITextField()
    field.backgroundColor = .clear
    field.textColor = .black
    field.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    field.restorationIdentifier = "email"
    return field
}()


let searchView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 59/2
    return view
}()


let searchImage: UIImageView = {
   let image = UIImageView()
    image.image = UIImage(named: "search")
    image.widthAnchor.constraint(equalToConstant: 36).isActive = true
    image.heightAnchor.constraint(equalToConstant: 36).isActive = true
    return image
}()


let cookedLabel: UILabel = {
   let label = UILabel()
    label.text = "You cooked 7 dishes"
    label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
    label.textColor = .white
    return label
}()


let wishListLabel: UILabel = {
    let label = UILabel()
     label.text = "Wish list"
     label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
     label.textColor = .white
     return label
}()
