//
//  Service.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-19.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class Service{
    static let shared = Service()
    
    init() {}
    
    
    func createNewUser(_ data: RegisterField, completion: @escaping (ResponseCode) -> ()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { result, error in
            if error == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                    let username = data.username
                    let data: [String: Any] = ["email": email, "username": username]
                    
                    Firestore.firestore().collection("users").document(userId!).setData(data)
                    completion(ResponseCode(code: 1))
                }
            } else {
                completion(ResponseCode(code: 0))
            }
        }
    }
    
    func confirmEmail() {
        Auth.auth().currentUser?.sendEmailVerification(completion: { err in
            if err != nil {
                print(err!.localizedDescription)
            }
        })
    }
    
    
    func authInApp(_ data: LoginField, completion: @escaping (AuthResponce) -> ()) {
        Auth.auth().signIn(withEmail: data.email, password: data.password) { result, err in
            if err != nil {
                completion(.error)
            } else {
                if let result = result {
                    if result.user.isEmailVerified {
                        completion(.success)
                    } else{
                        self.confirmEmail()
                        completion(.noVerify)
                    }
                }
            }
        }
    }
}

