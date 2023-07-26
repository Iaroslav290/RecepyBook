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

//            self.foodItems.sort { (item1, item2) in
//                        if item1.type == item2.type {
//                            // If the types are the same, sort by time
//                            return item1.time < item2.time
//                        } else {
//                            // If types are different, sort by type
//                            return item1.type < item2.type
//                        }
//                    }
            
            // Reload the collection view
            
            
 
func getAllDishes(completion: @escaping ([Product]) -> Void){
    let db = Firestore.firestore()
    let foodRef = db.collection("food")
    
    foodRef.getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error fetching food data: \(error.localizedDescription)")
            completion([]) // Return an empty array in case of error
            return
        }
        
        guard let documents = querySnapshot?.documents else {
            print("No documents found")
            completion([]) // Return an empty array if no documents are found
            return
        }
        
        var array: [Product] = []
        
        // Loop through the documents and create FoodItem objects
        for document in documents {
            let data = document.data()
            if let id = document.documentID as? String,
               let description = data["description"] as? String,
               let name = data["name"] as? String,
               let type = data["type"] as? String,
               let time = data["time"] as? String,
               let ingredients = data["ingridients"] as? [String],
               let recept = data["recept"] as? [String],
               let timestamp = data["timestamp"] as? Timestamp,
               let components = data["components"] as? [String],
               let cookTimes = data["cookTimes"] as? [Int] {
                
                let foodItem = Product(name: name, id: id, description: description, type: type, time: time, ingridients: ingredients, recept: recept, components: components, cookTimes: cookTimes, timestamp: timestamp)
                array.append(foodItem)
            }
        }
        
        completion(array)
        
        
    }
}
