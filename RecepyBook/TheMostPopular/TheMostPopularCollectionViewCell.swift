//
//  TheMostPopularCollectionViewCell.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-09.
//

import UIKit




class TheMostPopularCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "TheMostPopularCollectionViewCell"
    
    
    
    let imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 94/255, green: 178/255, blue: 158/255, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .light)
        return lbl
    }()
    
    let wishlistButton: UIButton = {
               let button = UIButton()
            button.backgroundColor = .blue
                button.translatesAutoresizingMaskIntoConstraints = false
               return button
           }()
    
    var isFirstCell: Bool = false {
            didSet {
                setNeedsLayout()
            }
        }
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(imageView)
            addSubview(nameLabel)
            addSubview(descriptionLabel)
            addSubview(wishlistButton)
        }
       
    override func layoutSubviews() {
            super.layoutSubviews()
            
            self.layer.cornerRadius = 30
            self.clipsToBounds = false
            
            if isFirstCell {
                // Customize the first cell
                
                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                    imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                    imageView.heightAnchor.constraint(equalToConstant: 200),
                    imageView.widthAnchor.constraint(equalToConstant: 200),
                    imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                    nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                    
                    descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                    
                    wishlistButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                    wishlistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                    wishlistButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                    wishlistButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                ])
            } else {
                // Reset properties for the remaining cells
                
                NSLayoutConstraint.activate([
                    imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                    imageView.heightAnchor.constraint(equalToConstant: 100),
                    imageView.widthAnchor.constraint(equalToConstant: 100),
                    
                    nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                    nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
                    
                    wishlistButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                    wishlistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                    wishlistButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                    wishlistButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                ])
            }
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
