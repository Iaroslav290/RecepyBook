//
//  MenuCollectionViewCell.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-30.
//

import UIKit




class MenuCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "MenuCollectionViewCell"
    
    
    
    let imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.textColor = UIColor(red: 94/255, green: 178/255, blue: 158/255, alpha: 1)
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return lbl
    }()
    
//    let descriptionLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.textColor = .black
//        lbl.numberOfLines = 0
//        lbl.font = UIFont.systemFont(ofSize: 24, weight: .light)
//        return lbl
//    }()
    
    
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(imageView)
            addSubview(nameLabel)
//            addSubview(descriptionLabel)
        }
       
    override func layoutSubviews() {
            super.layoutSubviews()
            
        
        
            self.layer.cornerRadius = 30
            self.clipsToBounds = false
//        self.layer.shadowColor = UIColor.red.cgColor
//        self.layer.shadowRadius = 10
//        self.layer.shadowOpacity = 50
//        self.layer.shadowOffset = .zero
            
                
                
                
                NSLayoutConstraint.activate([
                    imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                    imageView.heightAnchor.constraint(equalToConstant: screenSize.width / 7),
                    imageView.widthAnchor.constraint(equalToConstant: screenSize.width / 7),
                    
                    nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                    nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
                    
                   
                ])
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

