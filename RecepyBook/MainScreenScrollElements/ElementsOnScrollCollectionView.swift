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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0: print("1")
//            let newDishesVC = NewDishesViewController()
//
//                    // Retrieve the current view controller
//                    guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
//                        return
//                    }
//
//                    // Add the view of newDishesVC as a subview to the current view controller's view
//                    viewController.view.addSubview(newDishesVC.view)
//
//                    // Set the appropriate frame for the subview
//                    newDishesVC.view.frame = viewController.view.bounds
//
//                    // Call the viewDidLoad() method manually
//                    newDishesVC.viewDidLoad()
            
            let newDishesVC = NewDishesViewController()
                    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                        navigationController.pushViewController(newDishesVC, animated: true)
                    }
            
           
        case 1: print("2")
            
            let newDishesVC = NowInTrendViewController()
                    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                        navigationController.pushViewController(newDishesVC, animated: true)
                    }
        default: break
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
