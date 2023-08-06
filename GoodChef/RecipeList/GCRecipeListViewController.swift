//
//  GCRecipeListViewController.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 05/08/2023.
//

import UIKit

class GCRecipeListViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GCRecipeListCardCell.self, forCellWithReuseIdentifier: GCRecipeListCardCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension GCRecipeListViewController {
    func setupUI() {
        setupViews()
        setupLayout()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
