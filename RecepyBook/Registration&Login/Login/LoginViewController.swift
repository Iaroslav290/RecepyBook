//
//  LoginViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-11.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    var delegate: FirstScreenViewControllerDelegate!
    var checkField = CheckField.shared
    var service = Service.shared
    var userDefault = UserDefaults.standard

    var tapGest: UITapGestureRecognizer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEgiting))
        view.addGestureRecognizer(tapGest)
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }

        loginButton2.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
    }
    
    
    func configureElements() {
        [logoImageView, loginLabel, emailField, passwordField, loginButton2].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            logoImageView.heightAnchor.constraint(equalToConstant: screenSize.width / 1.65),
            logoImageView.widthAnchor.constraint(equalToConstant: screenSize.width / 1.65),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
//            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            logoImageView.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -(screenSize.height / 70)),


            
            loginLabel.bottomAnchor.constraint(equalTo: emailField.topAnchor, constant: -(screenSize.height / 30)),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            emailField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: (screenSize.height / 100) * 6),
            emailField.topAnchor.constraint(equalTo: view.centerYAnchor),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: (screenSize.height / 30)),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            
            loginButton2.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            loginButton2.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            loginButton2.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -(screenSize.height / 6)),
            loginButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
    
    @objc func loginAction() {
        if checkField.validField(self.view, emailField),
           checkField.validField(self.view, passwordField) {
            
            let authData = LoginField(email: emailField.text!, password: passwordField.text!)

            service.authInApp(authData) { [weak self] responce in
                switch responce {
                case .success:
                    self?.userDefault.set(true, forKey: "isLogin")
//                    self?.delegate.startApp()
                    
//                    let containerVC = ContainerViewController()
//                                let navigationController = UINavigationController(rootViewController: containerVC)
//                                navigationController.navigationBar.tintColor = .white
//                                self?.view.window?.rootViewController = navigationController
//                                self?.view.window?.makeKeyAndVisible()
//
//                                // Remove the current LoginViewController from its parent
//                                self?.removeFromParent()
//                                self?.view.removeFromSuperview()
                    
                    let userId = Auth.auth().currentUser?.uid
                    Firestore.firestore().collection("users").document(userId!).getDocument { (snapshot, error) in
                                    if let error = error {
                                        print("Error fetching user data: \(error.localizedDescription)")
                                        return
                                    }

                                    if let snapshot = snapshot, let userData = snapshot.data(), let userRole = userData["role"] as? String {
                                        if userRole == "admin" {
                                            // Present the admin view controller
                                            let adminVC = AddReceptViewController()
                                            let navigationController = UINavigationController(rootViewController: adminVC)
                                            navigationController.navigationBar.tintColor = .white
                                            self?.view.window?.rootViewController = navigationController
                                            self?.view.window?.makeKeyAndVisible()
                                        } else {
                                            // Present the user view controller
                                            let userVC = ContainerViewController()
                                            let navigationController = UINavigationController(rootViewController: userVC)
                                            navigationController.navigationBar.tintColor = .white
                                            self?.view.window?.rootViewController = navigationController
                                            self?.view.window?.makeKeyAndVisible()
                                        }
                                    }
                                }
                    
                    
                        
                    
//                    self?.delegate.closeVc()
//                    closeBar.isHidden = true
                case .noVerify:
                    let alert = self?.alertAction("Error", "You didn't verify your email. On your email was sended a link")
                    let verifyButton = UIAlertAction(title: "OK", style: .cancel)
                    alert?.addAction(verifyButton)
                    self?.present(alert!, animated: true)
                case .error:
                    let alert = self?.alertAction("Error", "Email or Password wrong")
                    let verifyButton = UIAlertAction(title: "OK", style: .cancel)
                    alert?.addAction(verifyButton)
                    self?.present(alert!, animated: true)
                }
            }
            
        } else {
            let alert = self.alertAction("Error", "Check info which you write")
            let verifyButton = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(verifyButton)
            self.present(alert, animated: true)
        }
    }
    
    func alertAction(_ header: String?, _ message: String?) -> UIAlertController {
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        return alert
    }
    
    @objc func endEgiting() {
        self.view.endEditing(true)
    }
}

