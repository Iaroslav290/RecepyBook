//
//  AddReceptViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-18.
//

import Foundation
import FirebaseStorage



class StorageService {
    
    static let shared = StorageService()
    private init() {}
    
    private var storage = Storage.storage().reference()
    private var productRef: StorageReference {
        storage.child("food")
    }
    
    func upload(id: String, image: Data, completion: @escaping (Result <String, Error>) -> ()) {
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        productRef.child(id).putData(image, metadata: metaData) { metadata, error in
            
            guard let metadata = metadata else {
                if let error = error {
                    completion(.failure(error))
                }
                
                return
            }
            
            completion(.success("Size of reseived image: \(metadata.size)"))
        }
        
    }
    
}


