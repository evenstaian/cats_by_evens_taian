//
//  HomeViewController.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 10/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//

import UIKit
import Lottie

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ViewCode {
    
    var dataSource : [Cat] = [Cat(title: "", images: [CatImage(link: "")])]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupViews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadCats()
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
    
    lazy var authorView : AuthorSign = {
        let aV = AuthorSign()
        aV.translatesAutoresizingMaskIntoConstraints = false
        let refreshGesture = UITapGestureRecognizer(target: self, action: #selector(refreshCats))
        aV.addGestureRecognizer(refreshGesture)
        return aV
    }()
    
    lazy var flowLayout : UICollectionViewLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let space = 5.0 as CGFloat
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        return flowLayout
    }()
    
    lazy var collectionView : UICollectionView = {
        let clView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        clView.register(CatCell.self, forCellWithReuseIdentifier: "cell")
        clView.delegate = self
        clView.dataSource = self
        clView.translatesAutoresizingMaskIntoConstraints = false
        clView.backgroundColor = .white
        return clView
    }()
    
    func setupViews(){
        view.addSubview(contentView)
        contentView.addSubview(loaderView)
        contentView.addSubview(collectionView)
        contentView.addSubview(authorView)
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
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            authorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    // MARK: Handles
    @objc
    func refreshCats(){
        print("chamou")
        loadCats()
    }
    
    func loadCats(){
        showLoader(status: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            DispatchQueue.main.async{
                APIRequests.getCats(){(data) in
                    do{
                        self.showLoader(status: false)
                        
                        let res = try JSONDecoder().decode(CatModelResponse.self, from: data)
                        self.dataSource = res.data
                        
                        DispatchQueue.main.async{
                            self.collectionView.reloadData()
                        }
                        
                    }catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    func showLoader(status : Bool){
        DispatchQueue.main.async{
            self.loaderView.isHidden = !status
            self.collectionView.isHidden = status
        }
    }
}

extension HomeViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CatCell
        
        cell.cat = dataSource[ indexPath.row ]

        return cell
    }
}
