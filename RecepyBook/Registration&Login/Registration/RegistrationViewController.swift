//
//  RegistrationViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-12.
//

import UIKit


class RegistrationViewController: UIViewController {
    
    var delegate: FirstScreenViewControllerDelegate!
    var checkField = CheckField.shared
    
    var tapGest: UITapGestureRecognizer!


    var service = Service.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEgiting))
        view.addGestureRecognizer(tapGest)
        
        configureElements()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        
        
    }
    
    
    func configureElements() {
        [registrationLabel, usernameFieldRegistration, emailFieldRegistration, passwordFieldRegistration, repeatPasswordFieldRegistration, registrationButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        registrationButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            registrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationLabel.bottomAnchor.constraint(equalTo: usernameFieldRegistration.topAnchor, constant: -(screenSize.height / 15)),


            
            usernameFieldRegistration.bottomAnchor.constraint(equalTo: emailFieldRegistration.topAnchor, constant: -(screenSize.height / 30)),
//            usernameFieldRegistration.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameFieldRegistration.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            usernameFieldRegistration.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),

//            emailFieldRegistration.topAnchor.constraint(equalTo: usernameFieldRegistration.bottomAnchor, constant: (screenSize.height / 30)),
            emailFieldRegistration.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(screenSize.height / 15)),
            emailFieldRegistration.leadingAnchor.constraint(equalTo: usernameFieldRegistration.leadingAnchor),
            emailFieldRegistration.trailingAnchor.constraint(equalTo: usernameFieldRegistration.trailingAnchor),

            passwordFieldRegistration.topAnchor.constraint(equalTo: emailFieldRegistration.bottomAnchor, constant: (screenSize.height / 30)),
            passwordFieldRegistration.leadingAnchor.constraint(equalTo: usernameFieldRegistration.leadingAnchor),
            passwordFieldRegistration.trailingAnchor.constraint(equalTo: usernameFieldRegistration.trailingAnchor),
            
            repeatPasswordFieldRegistration.topAnchor.constraint(equalTo: passwordFieldRegistration.bottomAnchor, constant: (screenSize.height / 30)),
            repeatPasswordFieldRegistration.leadingAnchor.constraint(equalTo: usernameFieldRegistration.leadingAnchor),
            repeatPasswordFieldRegistration.trailingAnchor.constraint(equalTo: usernameFieldRegistration.trailingAnchor),
            
            
            registrationButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -(screenSize.height / 7)),
            registrationButton.leadingAnchor.constraint(equalTo: usernameFieldRegistration.leadingAnchor),
            registrationButton.trailingAnchor.constraint(equalTo: usernameFieldRegistration.trailingAnchor),

        ])
    }
    
    @objc func signUpAction() {
        if checkField.validField(view, emailFieldRegistration),
           checkField.validField(view, passwordFieldRegistration){
            if passwordFieldRegistration.text == repeatPasswordFieldRegistration.text {
                service.createNewUser(RegisterField(username: usernameFieldRegistration.text!, email: emailFieldRegistration.text!, password: passwordFieldRegistration.text!)) { [weak self] code in
                    switch code.code {
                    case 0: print("Register error")
                    case 1: print("Congratulation, all good")
                        self?.service.confirmEmail()
                        let alert = UIAlertController(title: "OK", message: "Success", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "Good", style: .default) { _ in
//                            self?.delegate.closeVc()
                            self?.navigationController?.popViewController(animated: true)
//                            closeBar.isHidden = true
                        }
                        alert.addAction(okButton)
                        self?.present(alert, animated: true)
                    default: print("Unknown error")
                    }
                }
            }else {
                print("Bad")
            }

        }
    }
    
    @objc func endEgiting() {
        self.view.endEditing(true)
    }
}

