//
//  SettingsViewConttroller.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-20.
//

import UIKit


class SettingsViewController: UIViewController {
    
    var delegate: FirstScreenViewControllerDelegate!
    var checkField = CheckField.shared

    var service = Service.shared
    var userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        
    }
    
    
    func configureElements() {
        [signOutButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        signOutButton.addTarget(self, action: #selector(signOutAction), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            
            signOutButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -(screenSize.height / 7)),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),

        ])
    }
    
    @objc func signOutAction() {
        
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

