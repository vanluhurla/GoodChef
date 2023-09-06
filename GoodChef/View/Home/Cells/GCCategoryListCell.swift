//
//  GCCategoryListCell.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 18/06/2023.
//

import UIKit

class GCCategoryListCell: UICollectionViewCell {
    
    static var identifier = "ReusableGCCategoryListCell"
    
    private let imageSize = CGSize(width: 20, height: 20)
    private let categoryTitle = UILabel()
    private var cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundPrimary
        return view
    }()
    private var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(item: CategoryItem) {
        setupValues(item: item)
    }
}

private extension GCCategoryListCell {
    func setupValues(item: CategoryItem) {
        categoryTitle.text = item.category.title
        if let image = item.category.image?.withTintColor(.orange),
        let scaledImage = image.resize(to: imageSize) {
            iconImageView.image = scaledImage
        }
    }
    
    func setupUi() {
        setupViews()
        layoutViews()

    }
    
    func setupViews() {
        // Content View
        contentView.addSubview(cellView)
        // Cell View
        cellView.addSubview(cellStackView)
        // Cell Stack View
        cellStackView.addArrangedSubview(iconImageView)
        cellStackView.addArrangedSubview(categoryTitle)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            // Cell Stack View
            cellStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            cellStackView.topAnchor.constraint(equalTo: cellView.topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            // Icon Image View
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

private extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

