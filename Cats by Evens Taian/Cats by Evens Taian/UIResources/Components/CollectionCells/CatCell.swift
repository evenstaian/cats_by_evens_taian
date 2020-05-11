//
//  CatCell.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 10/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class CatCell: UICollectionViewCell {
    
    var cat : Cat? {
        didSet {
            guard let cat = cat else { return }
            guard let images : [CatImage] = cat.images else { return }
                image.sd_setImage(with: URL(string: images[0].link))
            name.text = cat.title
        }
    }
    
    fileprivate let card : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.96, alpha: 1.00)
        card.clipsToBounds = true
        card.layer.cornerRadius = 15
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00).cgColor
        return card
    }()
    
    fileprivate let name : UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .gray
        name.numberOfLines = 3
        return name
    }()
    
    fileprivate let image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        self.addSubview(card)
        card.addSubview(image)
        card.addSubview(name)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: self.topAnchor),
            card.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            card.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            card.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            image.topAnchor.constraint(equalTo: card.topAnchor),
            image.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            image.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            name.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -20),
            name.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),
            name.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
        ])
    }
}

