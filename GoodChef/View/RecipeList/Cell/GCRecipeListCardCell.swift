//
//  GCRecipeListCardCell.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 05/08/2023.
//

import UIKit

class GCRecipeListCardCell: UICollectionViewCell {
    
    static var identifier = "ReusableGCRecipeListCardCell"
    
    private var recipeListCardView: UIView = {
        let view = UIView()
        view.autoresizingMask = [.flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let recipeListFooterView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private var recipeTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func prepareForReuse() {
		super.prepareForReuse()
		recipeImageView.image = nil
	}

    func setupCellContent(item: RecipeListItem) {
        setupUI()
        setupValues(item: item)
    }
}

private extension GCRecipeListCardCell {
    func setupValues(item: RecipeListItem) {
        recipeTitleLabel.text = item.title
        recipeImageView.image = UIImage(named: "placeholder")
        recipeImageView.downloadImage(from: item.imageURL)
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        contentView.addSubview(recipeListCardView)
        recipeListCardView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(recipeImageView)
        mainStackView.addArrangedSubview(recipeListFooterView)
        recipeListFooterView.addSubview(recipeTitleStackView)
        recipeTitleStackView.addArrangedSubview(recipeTitleLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            recipeListCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeListCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeListCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeListCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: recipeListCardView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: recipeListCardView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: recipeListCardView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: recipeListCardView.bottomAnchor),
            
            recipeImageView.leadingAnchor.constraint(equalTo: recipeListCardView.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: recipeListCardView.trailingAnchor),
            recipeImageView.topAnchor.constraint(equalTo: recipeListCardView.topAnchor),
            NSLayoutConstraint(item: recipeImageView, attribute: .height, relatedBy: .equal, toItem: recipeImageView, attribute: .width, multiplier: 1.0, constant: 0.0),
            
            recipeTitleStackView.leadingAnchor.constraint(equalTo: recipeListFooterView.leadingAnchor),
            recipeTitleStackView.trailingAnchor.constraint(equalTo: recipeListFooterView.trailingAnchor),
            recipeTitleStackView.topAnchor.constraint(equalTo: recipeListFooterView.topAnchor),
            recipeTitleStackView.bottomAnchor.constraint(lessThanOrEqualTo: recipeListFooterView.bottomAnchor)
        ])
    }
}
