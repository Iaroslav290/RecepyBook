//
//  WishListCollectionView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import UIKit


class WishListCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let shared = WishListCollectionView()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(WishListCollectionViewCell.self, forCellWithReuseIdentifier: WishListCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = 15
        contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
   }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wishList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: WishListCollectionViewCell.reuseId, for: indexPath) as! WishListCollectionViewCell
        cell.imageView.image = wishList[indexPath.row].image
        cell.nameLabel.text = wishList[indexPath.row].name
        cell.descriptionLabel.text = wishList[indexPath.row].description
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 90)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
