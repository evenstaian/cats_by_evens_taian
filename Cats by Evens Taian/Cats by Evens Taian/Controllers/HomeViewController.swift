//
//  HomeViewController.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 10/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    fileprivate let animationView = AnimationView(name: "cat")
    
    lazy var contentView : UIView = {
        let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = .white
        return cView
    }()
    
    lazy var loaderView : CatLoader = {
        let lView = CatLoader(text: "Estamos procurando gatinhos pra você :)")
        lView.translatesAutoresizingMaskIntoConstraints = false
        return lView
    }()
    
    func setupViews(){
        view.addSubview(contentView)
        contentView.addSubview(loaderView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            loaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            loaderView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
