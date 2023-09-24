//
//  GCRecipeDetailsImageCell.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 24/09/2023.
//

import UIKit

class GCRecipeDetailsImageCell: UICollectionViewCell {
    
    static var identifier = "ReusableGCRecipeDetailsImageCell"
    
    private var recipeDetailsView: UIView = {
        let view = UIView()
        view.autoresizingMask = [.flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        return view
    }()
    private var recipeDetailsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var loadingImageIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.color = .gray
        loadingIndicator.startAnimating()
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        return loadingIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(item: RecipeImageItem) {
        setupUI()
        setupValues(item: item)
    }
}

private extension GCRecipeDetailsImageCell {
    func setupValues(item: RecipeImageItem) {
        recipeDetailsImageView.image = UIImage(named: "placeholder")
        recipeDetailsImageView.downloadImage(from: item.imageURL) { [weak self] in
            self?.loadingImageIndicator.stopAnimating()
        }
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        contentView.addSubview(recipeDetailsView)
        recipeDetailsView.addSubview(recipeDetailsImageView)
        recipeDetailsImageView.addSubview(loadingImageIndicator)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            // Card View
            recipeDetailsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeDetailsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeDetailsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeDetailsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            // Card Image View
            recipeDetailsImageView.leadingAnchor.constraint(equalTo: recipeDetailsView.leadingAnchor),
            recipeDetailsImageView.trailingAnchor.constraint(equalTo: recipeDetailsView.trailingAnchor),
            recipeDetailsImageView.topAnchor.constraint(equalTo: recipeDetailsView.topAnchor),
            recipeDetailsImageView.bottomAnchor.constraint(equalTo: recipeDetailsView.bottomAnchor),
            // Loading Indicator
            loadingImageIndicator.centerXAnchor.constraint(equalTo: recipeDetailsView.centerXAnchor),
            loadingImageIndicator.centerYAnchor.constraint(equalTo: recipeDetailsView.centerYAnchor)
        ])
    }
}
