//
//  GCRecipeDetailsViewController.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 06/09/2023.
//

import UIKit

class GCRecipeDetailsViewController: UIViewController {
 
// MARK: COLLECTION VIEW
    private var collectionView: UICollectionView = {
        let layout = GCRecipeDetailsCollectionViewLayout.layout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        collectionView.register(GCRecipeDetailsImageCell.self, forCellWithReuseIdentifier: GCRecipeDetailsImageCell.identifier)
        return collectionView
    }()

// MARK: DATA SOURCE
    private lazy var dataSource: GCRecipeDetailsDataSource = {
        let dataSource = GCRecipeDetailsDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else {
                return UICollectionViewCell()
            }
            switch itemIdentifier {
            case .image(let item):
                return recipeDetailsImage(collectionView: collectionView, indexPath: indexPath, item: item)
            case .ingredient(let item):
                return nil
            case .instruction(let item):
                return nil
            }
        }
        return dataSource
    }()
    
// MARK: VIEW MODEL
    let viewModel: GCRecipeDetailsViewModel
    
    init(viewModel: GCRecipeDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundSecondary
        viewModel.loadData()
        setupUI()
    }
}

// MARK: VIEW MODEL DELEGATE
extension GCRecipeDetailsViewController: GCRecipeDetailsViewModelDelegate {
    func didRecieveRecipes() {
        applySnapshot()
    }
}

//MARK: COLLECTION VIEW UI
private extension GCRecipeDetailsViewController {
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
// MARK: SNAPSHOT
    func applySnapshot() {
        var snapshot = GCRecipeDetailsSnapshot()
        snapshot.appendSections(RecipeDetailsSection.allCases)
        snapshot.appendItems(viewModel.buildImageItems(), toSection: RecipeDetailsSection.image)
        dataSource.apply(snapshot)
    }
}

// MARK: CELLS
private extension GCRecipeDetailsViewController {
    func recipeDetailsImage(collectionView: UICollectionView, indexPath: IndexPath, item: RecipeImageItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GCRecipeDetailsImageCell.identifier, for: indexPath) as? GCRecipeDetailsImageCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        return cell
    }
    
//    func recipeDetailsIngredient(collectionView: UICollectionView, indexPath: IndexPath, text: String) -> UICollectionViewCell {
//    }
//    
//    func recipeDetailsInstruction(collectionView: UICollectionView, indexPath: IndexPath, text: String) -> UICollectionViewCell {
//        
//    }
}
