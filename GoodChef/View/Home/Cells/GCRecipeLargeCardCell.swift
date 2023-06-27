//
//  GCRecipeLargeCardCell.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 18/06/2023.
//

import UIKit

class GCRecipeLargeCardCell: UICollectionViewCell {
    
    static var identifier = "ReusableGCRecipeLargeCardCell"
    
    private var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    private var cardView: UIView = {
        let view = UIView()
        view.autoresizingMask = [.flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    private var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(item: FeaturedItem) {
        setupUi()
        setupValues(item: item)
    }
}

private extension GCRecipeLargeCardCell {
    func setupValues(item: FeaturedItem) {
        recipeTitleLabel.text = item.title
        categoryTitleLabel.text = item.subtitle
        cardImageView.image = UIImage(named: "placeholder")
        // start loading
        cardImageView.downloadImage(from: item.imageURL)
        // finish loading
    }
    
    func setupUi() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        contentView.addSubview(cardView)
        cardView.addSubview(cardImageView)
        cardView.addSubview(footerView)
        footerView.addSubview(visualEffectView)
        footerView.addSubview(textStackView)
        textStackView.addArrangedSubview(recipeTitleLabel)
        textStackView.addArrangedSubview(categoryTitleLabel)
    }
    
    func layoutViews() {
        visualEffectView.frame = footerView.bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cardImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            cardImageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            cardImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            
            footerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            
            textStackView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            textStackView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
            textStackView.topAnchor.constraint(equalTo: footerView.topAnchor),
            textStackView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor)
        ])
    }
}


