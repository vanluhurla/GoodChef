//
//  GCHomeViewController.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import UIKit

class GCHomeViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GCCategoryListCell.self, forCellWithReuseIdentifier: GCCategoryListCell.identifier)
        collectionView.register(GCRecipeLargeCardCell.self, forCellWithReuseIdentifier: GCRecipeLargeCardCell.identifier)
        return collectionView
        
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
        view.backgroundColor = .primaryText
        viewModel.loadData()
        setupUi()
        temp_dataSource()
        
    }
}

//MARK: VIEW MODEL DELEGATE

extension GCHomeViewController: GCHomeViewModelDelegate {
    func didRecieveRecipes() {
        print("DID RECEIVE RECIPES: \(viewModel.recipes.count)")
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
}

extension GCHomeViewController {
    func temp_dataSource() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// Ignore this:

extension GCHomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GCRecipeLargeCardCell.identifier, for: indexPath) as? GCRecipeLargeCardCell else {
                return UICollectionViewCell()
            }
            cell.setupCellContent()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GCCategoryListCell.identifier, for: indexPath) as? GCCategoryListCell else {
                return UICollectionViewCell()
            }
            cell.setupCellContent()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.bounds.width

            // Calculate the desired width and height for your cells
            let cellWidth = width // Set it to the full width of the collection view

            return CGSize(width: cellWidth, height: 500) // Adjust the height as per your requirements
        }
}
