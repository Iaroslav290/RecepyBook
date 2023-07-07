//
//  ElementsOnScrollCollectionViewCell.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import UIKit

class ElementsOnScrollCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "ElementsOnScrollCollectionViewCell"
    
    let imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return lbl
    }()
    
    let arrowImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.image = UIImage(named: "arrow")
        imgv.contentMode = .scaleAspectFit
        return imgv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(arrowImageView)
        

        imageView.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 87).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 87).isActive = true
        
        
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        
        
        arrowImageView.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 30
//        self.layer.shadowRadius = 9
//        layer.shadowOpacity = 0.3
//        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
