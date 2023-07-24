//
//  FirstScreenViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-10.
//

import UIKit

protocol FirstScreenViewControllerDelegate {
    func openRegVc()
    func openAuthVc()
    func startApp()
    func closeVc()
}

class FirstScreenViewController: UIViewController {
    
    var authVc: LoginViewController!
    var regVc: RegistrationViewController!
    
    
    var delegate: FirstScreenViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)

    }
    
    
    func configureElements() {
        [welcomeLabel, duckyLabel, cookLabel, learnLabel, imageView, createButton, loginButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            loginButton.addTarget(self, action: #selector(openAuthVc), for: .touchUpInside)
            createButton.addTarget(self, action: #selector(openRegVc), for: .touchUpInside)

            
        }
        
        
        
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: (screenSize.height / 16)),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
            
            duckyLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 0),
            duckyLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            cookLabel.topAnchor.constraint(equalTo: duckyLabel.bottomAnchor, constant: 20),
            cookLabel.leadingAnchor.constraint(equalTo: duckyLabel.leadingAnchor),
            
            learnLabel.topAnchor.constraint(equalTo: cookLabel.bottomAnchor, constant: 20),
            learnLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            learnLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            
            imageView.topAnchor.constraint(equalTo: learnLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            createButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -(screenSize.height / 4.2)),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            createButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),

            
            loginButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: createButton.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: createButton.trailingAnchor),

        ])
    }
    
    @objc func loginAction() {
        delegate.openAuthVc()
    }
    
    @objc func createAction() {
        delegate.openRegVc()
    }
}





extension FirstScreenViewController: FirstScreenViewControllerDelegate {
    
    @objc func openAuthVc() {
        if authVc == nil {
            authVc = LoginViewController() as LoginViewController?
        }
        navigationController?.pushViewController(authVc, animated: true)
//        authVc.delegate = self
//        self.view.insertSubview(authVc.view, at: 7)
//        closeBar.isHidden = false

        
    }
    
    @objc func openRegVc() {
        if regVc == nil {
            regVc = RegistrationViewController() as RegistrationViewController?
        }
        navigationController?.pushViewController(regVc, animated: true)
        regVc.delegate = self
//        self.view.insertSubview(regVc.view, at: 1)
//        closeBar.isHidden = false


    }
    
    func closeVc() {
        if authVc != nil {
            authVc.view.removeFromSuperview()
            authVc = nil
        }
        if regVc != nil {
            regVc.view.removeFromSuperview()
            regVc = nil
        }
        
    }
    
    @objc func closeAction() {
        if authVc != nil {
            authVc.view.removeFromSuperview()
            authVc = nil
//            closeBar.isHidden = true

        }
        if regVc != nil {
            regVc.view.removeFromSuperview()
            regVc = nil
//            closeBar.isHidden = true

        }
    }
    
    func startApp() {
//        let startVc = ContainerViewController()
//        self.view.insertSubview(startVc.view, at: 2)
        
        let newViewController = ContainerViewController() // Replace "NewViewController" with the class name of your new view controller
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
}
