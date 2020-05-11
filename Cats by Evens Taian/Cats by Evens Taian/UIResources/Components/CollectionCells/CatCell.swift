//
//  CatCell.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 10/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import Foundation
import UIKit

class CatCell: UICollectionViewCell {
    
    var data : String? {
        didSet {
            print(data)
            guard let data = data else { return }
            image.text = data
        }
    }
    
    fileprivate let image : UILabel = {
        let image = UILabel()
        image.translatesAutoresizingMaskIntoConstraints = false
        /*
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        */
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(image)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        self.addSubview(image)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}

