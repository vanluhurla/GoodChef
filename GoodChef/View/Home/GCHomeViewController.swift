//
//  GCHomeViewController.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import UIKit

class GCHomeViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = GCHomeCollectionViewLayout.layout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GCCategoryListCell.self, forCellWithReuseIdentifier: GCCategoryListCell.identifier)
        collectionView.register(GCRecipeLargeCardCell.self, forCellWithReuseIdentifier: GCRecipeLargeCardCell.identifier)
        collectionView.register(GCHomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GCHomeHeader.identifier)
        return collectionView
    }()
    
    private lazy var dataSource: HomeDataSource = {
        let dataSource = HomeDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath,
            itemIdentifier in
            guard let self else {
                return UICollectionViewCell()
            }
            switch itemIdentifier {
            case .featured(let item):
                return largeCardCell(collectionView: collectionView, indexPath: indexPath, item: item)
            case .categories(let item):
                return categoryCell(collectionView: collectionView, indexPath: indexPath, item: item)
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
    
    let viewModel: GCHomeViewModel
    
    init(viewModel: GCHomeViewModel) {
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
        setupUi()
     
    }
}

//MARK: VIEW MODEL DELEGATE

extension GCHomeViewController: GCHomeViewModelDelegate {
    func didRecieveRecipes() {
        applySnapshot()
    }

    func didRecieveErrorWithMessage(_ message: String) {
        print("DID RECEIVE ERROR: \(message)")
    }
}

private extension GCHomeViewController {
    func setupUi() {
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
    
    func applySnapshot() {
        var snapshot = HomeSnapshot()
        snapshot.appendSections([GCHomeSection.featured])
        snapshot.appendItems(viewModel.featuredItems())
        snapshot.appendSections([GCHomeSection.categories])
        snapshot.appendItems(viewModel.categoryItems())
        dataSource.apply(snapshot)
    }
}

private extension GCHomeViewController {
    func largeCardCell(collectionView: UICollectionView, indexPath: IndexPath, item: RecipeItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GCRecipeLargeCardCell.identifier, for: indexPath) as? GCRecipeLargeCardCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        return cell
    }
    
    func categoryCell(collectionView: UICollectionView, indexPath: IndexPath, item: CategoryItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GCCategoryListCell.identifier, for: indexPath) as? GCCategoryListCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        return cell
    }
    
    func header(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GCHomeHeader.identifier, for: indexPath) as? GCHomeHeader,
              let section = GCHomeSection(rawValue: indexPath.section) else {
            return nil
        }
        sectionHeader.setupHeader(title: section.sectionTitle)
        return sectionHeader
    }
}
