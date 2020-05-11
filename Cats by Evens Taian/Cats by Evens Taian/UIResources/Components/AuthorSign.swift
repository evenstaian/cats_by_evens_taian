//
//  AuthorSign.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 11/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import Foundation
import UIKit

class AuthorSign : UIView, ViewCode {
    
    // MARK: Properties
    
    lazy var lbAssign : UILabel = {
        let lbLoader = UILabel()
        lbLoader.translatesAutoresizingMaskIntoConstraints = false
        lbLoader.text = "Powered by Evens Taian"
        lbLoader.textColor = .white
        lbLoader.textAlignment = .center
        lbLoader.numberOfLines = 3
        return lbLoader
    }()
    
    // MARK: Inits Methods
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .black
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setups
    func setupViews(){
        self.addSubview(lbAssign)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            lbAssign.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            lbAssign.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            lbAssign.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            lbAssign.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        ])
    }
    
    
}
