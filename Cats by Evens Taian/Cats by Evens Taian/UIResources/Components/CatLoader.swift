//
//  CatLoader.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 10/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class CatLoader : UIView {
    
    // MARK: Properties
    var text : String
    
    fileprivate let animationView = AnimationView(name: "cat")
    
    lazy var lbLoader : UILabel = {
        let lbLoader = UILabel()
        lbLoader.translatesAutoresizingMaskIntoConstraints = false
        lbLoader.text = self.text
        lbLoader.textColor = .gray
        lbLoader.textAlignment = .center
        lbLoader.numberOfLines = 3
        return lbLoader
    }()
    
    fileprivate func setupAnimationView() {
        self.animationView.translatesAutoresizingMaskIntoConstraints = false
        self.animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.animationView.isUserInteractionEnabled = false
        self.animationView.loopMode = .loop
        self.animationView.play()
    }
    
    // MARK: Inits Methods
    
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        setupViewsLoader()
        setupAnimationView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setups
    func setupViewsLoader(){
        self.addSubview(lbLoader)
        self.addSubview(animationView)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            animationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            lbLoader.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: -100),
            lbLoader.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            lbLoader.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            lbLoader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        ])
    }
    
    
}
