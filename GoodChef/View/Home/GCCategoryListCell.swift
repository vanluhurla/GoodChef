//
//  GCCategoryListCell.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 18/06/2023.
//

import UIKit

class GCCategoryListCell: UICollectionViewCell {
    
    static var identifier = "ReusableGCCategoryListCell"
    
    private let imageIcon = UIImage(named: "coffee-icon")?.withTintColor(.orange)
    private let imageSize = CGSize(width: 20, height: 20)
    private let categoryTitle = UILabel()
    private var cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    private var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.backgroundColor = .white
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent() {
        setupValues()
    }
}

private extension GCCategoryListCell {
    func setupValues() {
        categoryTitle.text = "Breakfast"
    }
    
    func setupUi() {
        setupViews()
        layoutViews()
        if let scaledImage = imageIcon?.resize(to: imageSize) {
            iconImageView.image = scaledImage
        }
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
            cellStackView.heightAnchor.constraint(equalToConstant: 50),
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

