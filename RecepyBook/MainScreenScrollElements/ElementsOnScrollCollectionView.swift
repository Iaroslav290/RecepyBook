//
//  ElementsOnScrollCollectionView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import UIKit


class ElementsOnScrollCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(ElementsOnScrollCollectionViewCell.self, forCellWithReuseIdentifier: ElementsOnScrollCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = 15
        contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
   }
    
    func set(cells: [QuickAccessLineElement]) {
        quickElements = cells
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quickElements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ElementsOnScrollCollectionViewCell.reuseId, for: indexPath) as! ElementsOnScrollCollectionViewCell
        cell.imageView.image = quickElements[indexPath.row].image
        cell.nameLabel.text = quickElements[indexPath.row].title
        cell.backgroundColor = quickElements[indexPath.row].backgroundColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 270, height: frame.height * 0.9)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
