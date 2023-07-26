//
//  MenuSelectCategoryCollectionViewCell.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-31.
//

import UIKit





class MenuSelectCategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "MenuSelectCategoryCollectionViewCell"
    
    
    
    let imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.contentMode = .scaleAspectFit
//        imgv.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        
        return imgv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.textColor = UIColor(red: 94/255, green: 178/255, blue: 158/255, alpha: 1)
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .bold)
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
    
    
    var isFirstCell: Bool = false {
            didSet {
                setNeedsLayout()
            }
        }
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(imageView)
            addSubview(nameLabel)
//            addSubview(descriptionLabel)
            
            
            
        }
    
       
    override func layoutSubviews() {
            super.layoutSubviews()
            
        let imageViewSize = screenSize.width / 5.5
        
            self.layer.cornerRadius = imageViewSize / 2
            self.clipsToBounds = false
//        self.layer.shadowColor = UIColor.red.cgColor
//        self.layer.shadowRadius = 10
//        self.layer.shadowOpacity = 50
//        self.layer.shadowOffset = .zero
//        self.backgroundColor = .green
        
//        imageView.layer.cornerRadius = (screenSize.width / 5.5) / 2
        
//        imageView.layer.cornerRadius = imageViewSize / 2 - 10
//               imageView.clipsToBounds = true
        
       
                        
                NSLayoutConstraint.activate([
//                    imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//                    imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
//                    imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                    imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    imageView.heightAnchor.constraint(equalToConstant: imageViewSize),
//                    imageView.heightAnchor.constraint(equalToConstant: screenSize.width / 7),
                    imageView.widthAnchor.constraint(equalToConstant: imageViewSize),
                    
                    nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                    nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
                    
                ])
        
//        self.imageView.layer.cornerRadius = imageView.frame.size.width / 2
//        self.imageView.clipsToBounds = true
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

