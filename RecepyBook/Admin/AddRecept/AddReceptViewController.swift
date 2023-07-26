//
//  AddReceptViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-18.
//

import UIKit
import FirebaseFirestore


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
    textField.layer.cornerRadius = (screenSize.height / 15) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 15)).isActive = true
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
    textField.layer.cornerRadius = (screenSize.height / 15) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 15)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()

let addReceptIngredients: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Ingredients", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "ingredients"
    textField.layer.cornerRadius = (screenSize.height / 15) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 12)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()

let addReceptType: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "type", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "type"
    textField.layer.cornerRadius = (screenSize.height / 15) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 15)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    return textField
}()

let addReceptTime: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Time", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "time"
    textField.layer.cornerRadius = (screenSize.height / 15) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 15)).isActive = true
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
     button.setTitle("X", for: .normal)
     button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
     button.tintColor = UIColor(red: 216/255, green: 215/255, blue: 232/255, alpha: 1)
     button.heightAnchor.constraint(equalToConstant: (screenSize.width / 7)).isActive = true
     button.widthAnchor.constraint(equalToConstant: (screenSize.width / 7)).isActive = true

 //    button.widthAnchor.constraint(equalToConstant: 310).isActive = true
     button.layer.cornerRadius = (screenSize.width / 7) / 2
     return button
}()

let addRecept: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(string: "Recept", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)])
    textField.font = UIFont(name: "Itim-Regular", size: (screenSize.width / 22)) // Set the font name and size
    textField.restorationIdentifier = "recept"
    textField.layer.cornerRadius = (screenSize.height / 15) / 2
    textField.layer.borderWidth = 5
    textField.layer.borderColor = UIColor.white.cgColor
    textField.heightAnchor.constraint(equalToConstant: (screenSize.height / 15)).isActive = true
//    textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    
    textField.rightView = paddingView
    textField.rightViewMode = .always
    
    return textField
}()

let options = ["Desserts", "Main Dishes", "Drinks", "Hors", "Appetizer", "Salad", "Soup"]
    
let dropdownButton: UIButton = {
    let button = UIButton()
    button.setTitle("Select Option", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
    button.layer.borderWidth = 5
    button.layer.borderColor = UIColor.white.cgColor
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

let dropedtableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .clear
    return tableView
}()

var dropdownVisible = false

class AddReceptViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var userDefault = UserDefaults.standard

    var tapGest: UITapGestureRecognizer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
            addReceptImageView.isUserInteractionEnabled = true
            addReceptImageView.addGestureRecognizer(tapGestureRecognizer)
        
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEgiting))
        view.addGestureRecognizer(tapGest)
        
        configureElements()
        
        addreceptLoginButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        //        for family in UIFont.familyNames.sorted() {
        //            let names = UIFont.fontNames(forFamilyName: family)
        //            print("Family: \(family) Font names: \(names)")
        //        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
        
        
    }
    
    
    func configureElements() {
        [addReceptLabel, addReceptImageView, addReceptName, addReceptDescription, addReceptType, addReceptTime, addReceptIngredients, addRecept, addreceptLoginButton, signOutButton2, dropdownButton, dropedtableView].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        dropdownButton.addTarget(self, action: #selector(dropdownButtonTapped), for: .touchUpInside)

        
        dropedtableView.isHidden = true
        dropedtableView.delegate = self
        dropedtableView.dataSource = self
        
        signOutButton2.addTarget(self, action: #selector(signOutAction2), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            addReceptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptLabel.bottomAnchor.constraint(equalTo: addReceptImageView.topAnchor, constant: -(screenSize.height / 70)),
            
            addReceptImageView.heightAnchor.constraint(equalToConstant: screenSize.width / 2.5),
            addReceptImageView.widthAnchor.constraint(equalToConstant: screenSize.width / 2.5),
            addReceptImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            //            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            addReceptImageView.bottomAnchor.constraint(equalTo: addReceptName.topAnchor, constant: -(screenSize.height / 70)),
            
            
            
            
            
            
            addReceptName.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            addReceptName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            addReceptName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
            
            addReceptDescription.topAnchor.constraint(equalTo: addReceptName.bottomAnchor, constant: (screenSize.height / 40)),
            addReceptDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptDescription.leadingAnchor.constraint(equalTo: addReceptName.leadingAnchor),
            addReceptDescription.trailingAnchor.constraint(equalTo: addReceptName.trailingAnchor),
            
            addReceptType.topAnchor.constraint(equalTo: addReceptDescription.bottomAnchor, constant: (screenSize.height / 40)),
            addReceptType.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptType.leadingAnchor.constraint(equalTo: addReceptName.leadingAnchor),
            addReceptType.trailingAnchor.constraint(equalTo: addReceptName.trailingAnchor),
            
            addReceptTime.topAnchor.constraint(equalTo: addReceptType.bottomAnchor, constant: (screenSize.height / 40)),
            addReceptTime.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptTime.leadingAnchor.constraint(equalTo: addReceptName.leadingAnchor),
            addReceptTime.trailingAnchor.constraint(equalTo: addReceptName.trailingAnchor),
            
            addReceptIngredients.topAnchor.constraint(equalTo: addReceptTime.bottomAnchor, constant: (screenSize.height / 40)),
            addReceptIngredients.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReceptIngredients.leadingAnchor.constraint(equalTo: addReceptName.leadingAnchor),
            addReceptIngredients.trailingAnchor.constraint(equalTo: addReceptName.trailingAnchor),
            
            addRecept.topAnchor.constraint(equalTo: addReceptIngredients.bottomAnchor, constant: (screenSize.height / 40)),
            addRecept.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addRecept.leadingAnchor.constraint(equalTo: addReceptName.leadingAnchor),
            addRecept.trailingAnchor.constraint(equalTo: addReceptName.trailingAnchor),
            
            addreceptLoginButton.leadingAnchor.constraint(equalTo: addReceptDescription.leadingAnchor),
            addreceptLoginButton.trailingAnchor.constraint(equalTo: addReceptDescription.trailingAnchor),
            addreceptLoginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(screenSize.height / 25)),
            addreceptLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signOutButton2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -(screenSize.width / 20)),
//            signOutButton2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
//            signOutButton2.widthAnchor.constraint(equalToConstant: (screenSize.width / 5)),
            signOutButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 20)),
            
            
            
            dropdownButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                    dropdownButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    dropdownButton.widthAnchor.constraint(equalToConstant: 150),
                    dropdownButton.heightAnchor.constraint(equalToConstant: 40),
                    
            dropedtableView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor),
            dropedtableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropedtableView.widthAnchor.constraint(equalToConstant: 150),
            dropedtableView.heightAnchor.constraint(equalToConstant: 170),
                  
            
        ])
    }
    
    
    @objc func dropdownButtonTapped() {
            dropdownVisible.toggle()
        dropedtableView.isHidden = !dropdownVisible
        tapGest.isEnabled = !dropdownVisible
        }
        
        // MARK: UITableViewDataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return options.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = options[indexPath.row]
            cell.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
            cell.textLabel?.textColor = .white
            cell.heightAnchor.constraint(equalToConstant: 50).isActive = true
            cell.layer.borderWidth = 5
            cell.layer.borderColor = UIColor.white.cgColor
            return cell
        }
        
        // MARK: UITableViewDelegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            dropdownButton.setTitle(options[indexPath.row], for: .normal)
            dropdownVisible = false
            dropedtableView.isHidden = true
            
            print("11")
            
            tapGest.isEnabled = true
        }
    
    func showImagePicker() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            // Choose from gallery action
            alertController.addAction(UIAlertAction(title: "Choose from Gallery", style: .default, handler: { _ in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }))
            
            // Take a picture action
            alertController.addAction(UIAlertAction(title: "Take a Picture", style: .default, handler: { _ in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true, completion: nil)
                } else {
                    // Camera not available
                    // You can show an alert or handle this case based on your preference
                    print("Camera is not available")
                }
            }))
            
            // Cancel action
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            // Present the action sheet
            present(alertController, animated: true, completion: nil)
        }
        
        // UIImagePickerController delegate methods
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                // Use the edited image if available
                addReceptImageView.image = editedImage
            } else if let originalImage = info[.originalImage] as? UIImage {
                // Use the original image if edited version is not available
                addReceptImageView.image = originalImage
            }
            
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    
    
    @objc func action() {
        
        guard let ingredientsString = addReceptIngredients.text else {
                // Handle the case where the ingredients text field is empty
                return
            }
            
            // Parse ingredientsString and create an array of ingredients
            let ingredients = ingredientsString.components(separatedBy: "&").map { $0.trimmingCharacters(in: .whitespaces) }
        
        guard let receptString = addRecept.text else {
                // Handle the case where the ingredients text field is empty
                return
            }
            
            // Parse ingredientsString and create an array of ingredients
            let components = receptString.components(separatedBy: "&").map { $0.trimmingCharacters(in: .whitespaces) }
        var recept: [String] = []
        var cookTimes: [Int] = []
        
        for component in components {
                let parts = component.components(separatedBy: "(")
                if parts.count == 2 {
                    recept.append(parts[0].trimmingCharacters(in: .whitespaces))
                    let timeString = parts[1].components(separatedBy: ")")[0].trimmingCharacters(in: .whitespaces)
                    if let time = Int(timeString) {
                        cookTimes.append(time)
                    } else {
                        cookTimes.append(0) // Default time if not specified
                    }
                } else {
                    recept.append(component)
                    cookTimes.append(0) // Default time if not specified
                }
            }
        
        print(recept)
        print(cookTimes)
        
        let currentDate = Date()
            
            // Convert the Date object to a Timestamp object
        let timestamp = Timestamp(date: currentDate)
            
        
        let product = Product(name: addReceptName.text!,
                              id: UUID().uuidString,
                              description: addReceptDescription.text!,
//                              type: addReceptType.text!,
                              type: dropdownButton.titleLabel?.text ?? "",
                              time: addReceptTime.text!,
                              ingridients: ingredients,
                              recept: recept,
                              components: components,
                              cookTimes: cookTimes,
                              timestamp: timestamp)
        let imageData = addReceptImageView.image?.jpegData(compressionQuality: 0.3)
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
    
    @objc func didTapImageView() {
        showImagePicker()
    }
    
    @objc func endEgiting() {
        self.view.endEditing(true)
    }


    @objc func keyboardWillShow(_ notification: Notification) {
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                let keyboardHeight = keyboardFrame.height

                // Check if the active text field is obscured by the keyboard
                if let activeTextField = findFirstResponder() as? UITextField {
                    let convertedRect = activeTextField.convert(activeTextField.bounds, to: self.view)
                    let obscuredHeight = self.view.frame.height - convertedRect.origin.y - activeTextField.frame.height

                    if obscuredHeight < keyboardHeight {
                        // Move the view up by the height difference to make the active text field visible
                        UIView.animate(withDuration: 0.3) {
                            self.view.frame.origin.y = 0
                            self.view.frame.origin.y -= (keyboardHeight - obscuredHeight)
                        }
                    }
                }
            }
        }

        // Function to adjust the view's position when the keyboard hides
        @objc func keyboardWillHide(_ notification: Notification) {
            // Move the view back to its original position
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = 0
            }
        }

        // Function to find the first responder (active) text field
        private func findFirstResponder() -> UIView? {
            var firstResponder: UIView?
            for subview in self.view.subviews {
                if subview.isFirstResponder {
                    firstResponder = subview
                    break
                }
            }
            return firstResponder
        }

        deinit {
            // Remove the observers to avoid memory leaks
            NotificationCenter.default.removeObserver(self)
        }



}



