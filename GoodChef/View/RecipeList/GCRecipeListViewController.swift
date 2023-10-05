//
//  GCRecipeListViewController.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 05/08/2023.
//

import UIKit

class GCRecipeListViewController: UIViewController {
    
// MARK: COLLECTION VIEW
    private var collectionView: UICollectionView = {
        let layout = GCRecipeListCollectionViewLayout.layout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        collectionView.register(GCRecipeListCardCell.self, forCellWithReuseIdentifier: GCRecipeListCardCell.identifier)
        collectionView.register(GCRecipeListHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GCRecipeListHeader.identifier)
        return collectionView
    }()

// MARK: DATA SOURCE
    private lazy var dataSource: GCRecipeListDataSource = {
        let dataSource = GCRecipeListDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self = self else {
                return UICollectionViewCell()
            }
            switch itemIdentifier {
            case .allRecipes(let item):
                return recipeListCell(collectionView: collectionView, indexPath: indexPath, item: item)
            }
        }
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self else {
                return nil
            }
            return header(collectionView: collectionView, kind: kind, indexPath: indexPath)
        }
        return dataSource
    }()
    
// MARK: VIEW MODEL
    let viewModel: GCRecipeListViewModel
    
    init(viewModel: GCRecipeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundSecondary
        viewModel.loadData()
		setupCollectionView()
        setupUI()
    }
}

extension GCRecipeListViewController: GCRecipeListViewModelDelegate {
    func didRecieveRecipes() {
        applySnapshot()
    }
}

// MARK: RECIPE LIST VIEW CONTROLLER UI
private extension GCRecipeListViewController {
	func setupCollectionView() {
		collectionView.delegate = self
	}
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
        var snapshot = GCRecipeListSnapshot()
        snapshot.appendSections(GCListSection.allCases)
        snapshot.appendItems(viewModel.allItems())
        dataSource.apply(snapshot)
    }
}

extension GCRecipeListViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		viewModel.didSelectItem(indexPath: indexPath)
	}
}

// MARK: CELL
private extension GCRecipeListViewController {
    func recipeListCell(collectionView: UICollectionView, indexPath: IndexPath, item: RecipeListItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GCRecipeListCardCell.identifier, for: indexPath) as? GCRecipeListCardCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        return cell
    }
    
    func header(collectionView: UICollectionView, kind:String, indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GCRecipeListHeader.identifier, for: indexPath) as? GCRecipeListHeader else {
            return UICollectionReusableView()
        }
        sectionHeader.setupHeader(title: viewModel.headerTitle)
        return sectionHeader
    }
}
