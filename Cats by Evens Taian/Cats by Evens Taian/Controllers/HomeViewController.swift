//
//  HomeViewController.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 10/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    lazy var contentView : UIView = {
        let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = .white
        return cView
    }()
    
    func setupViews(){
        view.addSubview(contentView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
