//
//  AddReceptViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-18.
//

import UIKit

let addReceptLabel: UILabel = {
   let label = UILabel()
    label.text = "Add Recept"
    label.font = UIFont(name: "JetBrainsMono-Regular", size: 40)
    label.textColor = .white
    return label
}()

let addReceptImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "hamburger")
//    imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//    imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    imageView.contentMode = .scaleAspectFit
    return imageView
}()

let addReceptName: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "name"
    textField.layer.cornerRadius = 40
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: 80).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
        textField.rightView = paddingView
        textField.rightViewMode = .always
    
    return textField
}()

let addReceptDescription: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "description"
    textField.layer.cornerRadius = 40
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: 80).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()



let addreceptLoginButton: UIButton = {
   let button = UIButton()
    button.backgroundColor = UIColor(red: 80/255, green: 43/255, blue: 158/255, alpha: 1)
    button.setTitle("Add", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
    button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
    button.heightAnchor.constraint(equalToConstant: 80).isActive = true
//    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
    button.layer.cornerRadius = 40
    return button
}()

let signOutButton2: UIButton = {
    let button = UIButton()
     button.backgroundColor = UIColor(red: 80/255, green: 43/255, blue: 158/255, alpha: 1)
     button.setTitle("SignOut", for: .normal)
     button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
     button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
     button.heightAnchor.constraint(equalToConstant: 80).isActive = true
 //    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
     button.layer.cornerRadius = 40
     return button
}()



class AddReceptViewController: UIViewController {
    
    var userDefault = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        configureElements()
        
        addreceptLoginButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        //        for family in UIFont.familyNames.sorted() {
        //            let names = UIFont.fontNames(forFamilyName: family)
        //            print("Family: \(family) Font names: \(names)")
        //        }
        
        
    }
    
    
    func configureElements() {
        [addReceptLabel, addReceptImageView, addReceptName, addReceptDescription, addreceptLoginButton, signOutButton2].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        signOutButton2.addTarget(self, action: #selector(signOutAction2), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            addReceptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptLabel.bottomAnchor.constraint(equalTo: addReceptImageView.topAnchor, constant: -(screenSize.height / 70)),
            
            addReceptImageView.heightAnchor.constraint(equalToConstant: screenSize.width / 1.65),
            addReceptImageView.widthAnchor.constraint(equalToConstant: screenSize.width / 1.65),
            addReceptImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            //            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            addReceptImageView.bottomAnchor.constraint(equalTo: addReceptName.topAnchor, constant: -(screenSize.height / 70)),
            
            
            
            
            
            addReceptName.topAnchor.constraint(equalTo: view.centerYAnchor),
            addReceptName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            addReceptName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
            
            addReceptDescription.topAnchor.constraint(equalTo: addReceptName.bottomAnchor, constant: (screenSize.height / 30)),
            addReceptDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptDescription.leadingAnchor.constraint(equalTo: addReceptName.leadingAnchor),
            addReceptDescription.trailingAnchor.constraint(equalTo: addReceptName.trailingAnchor),
            
            addreceptLoginButton.leadingAnchor.constraint(equalTo: addReceptDescription.leadingAnchor),
            addreceptLoginButton.trailingAnchor.constraint(equalTo: addReceptDescription.trailingAnchor),
            addreceptLoginButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -(screenSize.height / 6)),
            addreceptLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signOutButton2.topAnchor.constraint(equalTo: view.topAnchor, constant: (screenSize.height / 7)),
            signOutButton2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 100)),
            signOutButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
            
        ])
    }
    @objc func action() {
        let product = Product(name: addReceptName.text!, id: UUID().uuidString, description: addReceptDescription.text!)
        let imageData = imageView.image?.jpegData(compressionQuality: 0.3)
        DatabaseService.shared.setRecept(product: product, image: imageData!) { result in
            
            switch result {
            case .success(let product):
                print(product.name)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    @objc func signOutAction2() {
        
        self.userDefault.set(false, forKey: "isLogin")
        
        let firstScreen = FirstScreenViewController()
                    let navigationController = UINavigationController(rootViewController: firstScreen)
                    navigationController.navigationBar.tintColor = .white
                    self.view.window?.rootViewController = navigationController
                    self.view.window?.makeKeyAndVisible()

                    // Remove the current LoginViewController from its parent
                    self.removeFromParent()
                    self.view.removeFromSuperview()
    }
    
}



