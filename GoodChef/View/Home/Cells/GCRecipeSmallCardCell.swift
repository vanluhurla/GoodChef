//
//  GCRecipeSmallCardCell.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 20/07/2023.
//

import UIKit

class GCRecipeSmallCardCell: UICollectionViewCell {
    
    static var identifier = "ReusableGCRecipeSmallCardCell"
    
    private var recipeCardView: UIView = {
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
    private var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var cardFooterView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private var titleStackView: UIStackView = {
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
    
    func setupCellContent(item: RecipeItem) {
        setupValues(item: item)
        setupUI()
    }
}

private extension GCRecipeSmallCardCell {
    func setupValues(item: RecipeItem) {
        recipeTitleLabel.text = item.title
        cardImageView.image = UIImage(named: "placeholder")
        cardImageView.downloadImage(from: item.imageURL)
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        contentView.addSubview(recipeCardView)
        recipeCardView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(cardImageView)
        mainStackView.addArrangedSubview(cardFooterView)
        cardFooterView.addSubview(titleStackView)
        titleStackView.addArrangedSubview(recipeTitleLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            recipeCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: recipeCardView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: recipeCardView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: recipeCardView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: recipeCardView.bottomAnchor),
            
            cardImageView.leadingAnchor.constraint(equalTo: recipeCardView.leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: recipeCardView.trailingAnchor),
            cardImageView.topAnchor.constraint(equalTo: recipeCardView.topAnchor),
            NSLayoutConstraint(item: cardImageView, attribute: .height, relatedBy: .equal, toItem: cardImageView, attribute: .width, multiplier: 1.0, constant: 0.0),
            
            titleStackView.leadingAnchor.constraint(equalTo: cardFooterView.leadingAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: cardFooterView.trailingAnchor),
            titleStackView.topAnchor.constraint(equalTo: cardFooterView.topAnchor),
            titleStackView.bottomAnchor.constraint(lessThanOrEqualTo: cardFooterView.bottomAnchor)
        ])
    }
}
