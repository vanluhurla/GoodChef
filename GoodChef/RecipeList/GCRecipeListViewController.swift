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
    
    private lazy var dataSource: GCRecipeListDataSource = {
        let dataSource = GCRecipeListDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self = self else {
                return UICollectionViewCell()
            }
            if case .allRecipes(let item) = itemIdentifier {
                return recipeListCell(collectionView: collectionView, indexPath: indexPath, item: item)
            } else {
                return UICollectionViewCell()
            }
        }
        return dataSource
    }()
    
    let viewModel: GCRecipeListViewModel
    
    init(viewModel: GCRecipeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

private extension GCRecipeListViewController {
    func recipeListCell(collectionView: UICollectionView, indexPath: IndexPath, item: RecipeListItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GCRecipeListCardCell.identifier, for: indexPath) as? GCRecipeListCardCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        return cell
    }
}
