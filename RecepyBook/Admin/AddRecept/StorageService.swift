//
//  Service.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-16.
//

import Foundation
import FirebaseFirestore

struct Product {
    var name: String
    var id: String
//    var title: String
//    var imageUrl: String
    var description: String
    
    
    var represintation: [String: Any] {
        
        var repres = [String: Any]()
        repres["name"] = self.name
        repres["id"] = self.id
//        repres["title"] = self.title
        repres["description"] = self.description
        
        return repres
    }
}

class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    
    private var productsRef: CollectionReference {
        return db.collection("food")
    }
    
    
    
    func setRecept(product: Product, image: Data, completion: @escaping (Result <Product, Error>) -> ()) {
        
        StorageService.shared.upload(id: product.id, image: image) { result in
            
            switch result {
            case .success(let sizeinfo):
                print(sizeinfo)
                
                self.productsRef.document(product.id).setData(product.represintation) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(product))
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}
